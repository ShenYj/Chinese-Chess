//
//  Informationable.swift
//  
//
//  Created by ShenYj on 2021/02/10.
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

import DeviceKit
import SwiftDate
import SwifterSwift
import FCUUID


public protocol Informationable { }

// MARK: 设备信息
public extension Informationable {
    
    /// 设备 idfv 信息
    ///
    /// - Note: 设备 idfv 信息
    ///
    var idfv: String { UIDevice.current.identifierForVendor?.uuidString ?? "none" }
    
    /// 设备 UUID 信息
    ///
    /// - Note: UUID 有效期:
    /// - Note: YiUUID.uuidForDevice() has a bug
    ///
    /// 
    ///         App memory    App relaunch    Reset Advertising Identifier    App reinstall    System reboot    System upgrade   System reset
    ///             √               √                       √                       √                √                √              √**
    ///
    ///
    var deviceID: String { FCUUID.uuidForDevice() }
    
    /// 获取系统名称
    ///
    /// - Note:     The name of the operating system running on the device represented by the receiver (e.g. "iOS" or "tvOS").
    /// - seealso:  `DeviceKit`
    ///
    var systemName: String { Device.current.systemName?.withoutSpacesAndNewLines ?? "unknow" }
    
    /// 获取设备型号
    ///
    /// - Note: 包含空格
    ///
    var deviceNameWithSpace: String {
        Device.current.safeDescription
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
    }
    
    /// 获取设备型号 [不带空格]
    ///
    /// - Note: 去掉了空格信息
    ///
    var deviceName: String {
        deviceNameWithSpace.withoutSpacesAndNewLines
        //deviceNameWithSpace.withoutSpace
    }
    
}

// MARK: 时间戳
public extension Informationable {
    
    /// 时间戳
    ///
    /// - Note: 精确到秒
    ///
    var timestamp: Int { lround(ceil(Date().timeIntervalSince1970)) }
    var timestampString: String { "\(timestamp)" }
    
    ///
    /// 时间戳
    ///
    /// - Note: 与服务器 UTC 时间比对后的时间戳, 加了偏移量,  精确到秒
    ///
//    var calibrationTimestamp: Int { timestamp + LocalManager.shared.timestampOffset }
//    var calibrationTimestampString: String { "\(calibrationTimestamp)" }
}

// MARK: iOS 版本信息
public extension Informationable {
    
    /// 当前 iOS 系统版本
    ///
    /// - Note: 返回值为字符串类型 获取失败返回一个不兼容的版本`10.0`
    ///
    var systemVersion: String { Device.current.systemVersion ?? "10.0" }

}

// MARK: App 版本信息
public extension Informationable {
    
    /// App 当前版本
    ///
    /// - Note: 返回字符串
    /// - Note: `App的版本要由三位组成, 并且每个子版本号只支持一位` e.g.: `1.0.0`
    ///
    var appVersion: String {
        guard let versionString = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String else { return "1.0.0" }
        if versionString.firstIndex(of: ".") != versionString.lastIndex(of: ".") {
            return versionString
        }
        return makeup(version: versionString).map{ $0.string }.joined(separator: ".")
    }
    
    /// 版本号位数补齐
    ///
    /// - Note: 保证三个元素长度的集合
    ///
    func makeup(version: String) -> [Int] {
        var subVersions = version.split(separator: ".").compactMap{ Int($0) }
        switch subVersions.count {
        case 3:
            return subVersions
        case 2:
            subVersions.append(0)
            return subVersions
        case 1:
            subVersions.append(contentsOf: [0, 0])
            return subVersions
        case 0:
            return Array<Int>.init(repeating: 3, count: 0)
        default:
            subVersions.removeLast(subVersions.count - 3)
            return subVersions
        }
    }
}

// MARK: 获取设备屏幕信息
public extension Informationable {
    
    /// UIScreen.main.bounds.size
    static var mainScreenSize: CGSize { UIScreen.main.bounds.size }
    
    /// 竖屏下屏幕宽度
    static var mainScreenWidth: CGFloat { mainScreenSize.width }
    /// 竖屏下屏幕高度
    static var mainScreenHeight: CGFloat { mainScreenSize.height }
    
    /// 获取屏幕宽高最小值
    static var mainScreenMinSize: CGFloat { min(mainScreenWidth, mainScreenHeight) }
    /// 获取屏幕宽高最大值
    static var mainScreenMaxSize: CGFloat { max(mainScreenWidth, mainScreenHeight) }
    
}
