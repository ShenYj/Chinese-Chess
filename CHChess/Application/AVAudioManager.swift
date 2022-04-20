//
//  AVAudioManager.swift
//  CHChess
//
//  Created by ShenYj on 2022/03/30.
//
//  Copyright (c) 2021 ShenYj <shenyanjie123@foxmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import AVFoundation
import UIKit
import RxSwift
import RxCocoa
import PPILibrary

enum AudioSource {
    case online
    case local
}

class AVAudioManager: ReactiveCompatible {
    
    static let `default` = AVAudioManager()
    
    /// 音乐播放器
    fileprivate var localPlayer: AVAudioPlayer?
    fileprivate var onlinePlayer: AVPlayer?
    
    public private(set) var audioSource: AudioSource = .local
    /// 正在播放歌曲名称
    public private(set) var currentMusicName: String?
    
    /// 总时长
    public var duration: TimeInterval? { localPlayer?.duration }
    /// 当前时间
    public var currentTime: TimeInterval? { localPlayer?.currentTime }

    private init() {
        
        // 后台运行音乐 需要设置音频会话的类型
        do {
            /*
             enum {
             kAudioSessionCategory_AmbientSound              = 'ambi',
             kAudioSessionCategory_SoloAmbientSound          = 'solo',
             kAudioSessionCategory_MediaPlayback             = 'medi',  --> 后台播放
             kAudioSessionCategory_RecordAudio               = 'reca',
             kAudioSessionCategory_PlayAndRecord             = 'plar',
             kAudioSessionCategory_AudioProcessing           = 'proc'
             };
             */
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            log.error("设置音频会话出错: \(error)")
        }
        // 开启远程控制器后,才会后台自动切歌播放(开启线控,还能支持耳机上的线控操作)
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        // 注册通知
        registerNotifications()
    }
}

extension AVAudioManager {
    
    /// 设置播放进度
    public func set(CurrentTime time: TimeInterval) {
        switch audioSource {
        case .online:   onlinePlayer?.seek(to: CMTime(seconds: time, preferredTimescale: .min))
        case .local:    localPlayer?.currentTime = time
        }
    }
    
    /// 暂停
    public func pauseMusic() {
        switch audioSource {
        case .online:   onlinePlayer?.pause()
        case .local:    localPlayer?.pause()
        }
    }
    
    /// 通过音乐名称, 播放本地音频
    public func play(MusicWithFileName musicName: String) {
        
        audioSource = .local
        if currentMusicName != musicName {
            
            guard let filePath = Bundle.main.path(forResource: musicName, ofType: nil) else {
                fatalError("TODO: to be fixed!")
            }
            
            do {
                localPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath))
                localPlayer?.prepareToPlay()
                currentMusicName = musicName
            } catch {
                log.error("播放器初始化失败: \(error)")
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.localPlayer?.play()
        }
    }
    
    /// 通过音乐名称, 播放本地音频
    public func play(onlineMusicLink musicLink: String, musicName: String) {
        
        audioSource = .online
        guard let url = URL(string: musicLink) else {
            fatalError("TODO: to be fixed!")
        }
        let playItem = AVPlayerItem(url: url)
        onlinePlayer = AVPlayer(playerItem: playItem)
        currentMusicName = musicName
        onlinePlayer?.play()
    }
}

extension AVAudioManager {
    
    private func registerNotifications() {
        
        // 监听事件中断通知
        _ = NotificationCenter.default
            .rx.notification(AVAudioSession.interruptionNotification)
            .subscribe(with: self, onNext: { (owner, notification) in
                log.verbose("\(#function)")
            })
        // 其他App占用/解除占用AVAudioSession通知
        _ = NotificationCenter.default
            .rx.notification(AVAudioSession.silenceSecondaryAudioHintNotification)
            .subscribe(with: self, onNext: { (owner, notification) in
                log.verbose("\(#function)")
            })
        // 路线改变通知(如,扬声器切换为耳机.也就是耳机插入设备)
        _ = NotificationCenter.default
            .rx.notification(AVAudioSession.routeChangeNotification)
            .bind(to: rx.routeChangeNotification())
    }
}

extension Reactive where Base: AVAudioManager {
    
    fileprivate func pause() -> Binder<Void> {
        Binder(base) { owner,_  in owner.pauseMusic() }
    }
    
    /*
         监听到的中断事件通知, AVAudioSessionInterruptionType
         typedef NS_ENUM(NSUInteger, AVAudioSessionInterruptionType)
         {
             AVAudioSessionInterruptionTypeBegan = 1,  中断开始
             AVAudioSessionInterruptionTypeEnded = 0,  中断结束
         }
     */
    fileprivate func routeChangeNotification() -> Binder<Notification> {
        Binder(base) { owner, notification in
            guard let useInfo = notification.userInfo else { return }
            guard let interruptionTypeKey = useInfo[AVAudioSessionInterruptionTypeKey] as? AVAudioSession.InterruptionType else { return }
            switch interruptionTypeKey {
            case .began:
                owner.pauseMusic()
                log.verbose("中断开始 --> 暂停播放")
            case .ended:
                guard let interruptionOptionType = useInfo[AVAudioSessionInterruptionOptionKey] as? AVAudioSession.InterruptionOptions else { return }
                switch interruptionOptionType {
                case .shouldResume:
                    
                    switch owner.audioSource {
                    case .online:   owner.onlinePlayer?.play()
                    case .local:    owner.localPlayer?.play()
                    }
                    log.verbose("中断结束 --> 继续播放")
                default:
                    log.verbose("另一个音频会话的中断已结束，但应用程序此时不满足恢复其音频会话")
                }
            @unknown default:
                fatalError()
            }
        }
    }
}
