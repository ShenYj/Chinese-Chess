//
//  Application.swift
//  CHChess
//
//  Created by ShenYj on 2021/07/06.
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


import UIKit
import WebKit
import Foundation
import SVProgressHUD
import IQKeyboardManagerSwift
#if DoKit
import DoraemonKit
#endif

struct AppDependency {
    
    /// 业务Windows
    let window: UIWindow
    /// 路由
    let router: Router
    /// 偏好存储
    let preferences: AppPreferences
    /// 音频管理
    let audioManager: AVAudioManager
    
    let configureAppearance: () -> Void
    let configureSDKs: () -> Void
}


final public class Application {
    
    static let `default` = Application()
    fileprivate let disposeBag = DisposeBag()
    
    func initial() -> AppDependency {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        
        Router.default
            .navigate(transition: .root(in: window, rootController: Router[.launch(viewModel: LaunchViewModel())], needNavigator: false))
        
        return AppDependency(
            window: window,
            router: Router.default,
            preferences: AppPreferences.default,
            audioManager: AVAudioManager.default,
            configureAppearance: configureAppearance,
            configureSDKs: configureSDKs
        )
    }
}

extension Application {
    
    /// 初始化`SDK`
    func configureSDKs() {
        
        /// SVP
        SVProgressHUD.appearance().minimumSize = CGSize(width: 100, height: 80)
        SVProgressHUD.appearance().imageViewSize = CGSize(width: 20, height: 20)
        SVProgressHUD.appearance().backgroundColor = .black.alpha(0.8)
        SVProgressHUD.appearance().foregroundColor = .white
        SVProgressHUD.appearance().font = UIFont.systemFont(ofSize: 12)
        SVProgressHUD.appearance().defaultStyle = .custom
        SVProgressHUD.appearance().defaultMaskType = .clear
        SVProgressHUD.appearance().defaultAnimationType = .flat
        
        /// Toast
        ToastManager.shared.isTapToDismissEnabled = false
        ToastManager.shared.isQueueEnabled = true
        ToastManager.shared.position = .center
        var style = ToastStyle()
        style.backgroundColor = UIColor.Material.black
        style.messageColor = UIColor.Material.white
        style.imageSize = CGSize(width: 20, height: 20)
        ToastManager.shared.style = style
        
        /// 键盘处理
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        /// 滴滴DoKit 部分场景下会影响视图层级， 如检查更新弹层的处理
#if DoKit
        DoraemonManager.shareInstance().install(withPid: "d6cb41d9ecf1b9d35964af8edae9aae4")
#endif
    }
    
    /// 初始化配置
    func configureAppearance() {
        
        /// 导航栏样式
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.SYS_BOLD_F16
        ]
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            appearance.backgroundColor = .bcr4566E0
            appearance.titleTextAttributes = attributes
            appearance.largeTitleTextAttributes = attributes
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
            UINavigationBar.appearance().titleTextAttributes = attributes
            UINavigationBar.appearance().barTintColor = UIColor.bcr4566E0
        }
        
    }
}
