//
//  AppPreferences.swift
//  CHChess
//
//  Created by ShenYj on 2021/8/17.
//

import Foundation
import SwiftyUserDefaults

// MARK: 对外接口

/** 说明:
 
    对外使用 `AppPreferences.default`访问
 
    并非对外所有文件中使用,  目前账号、token 统一在`AuthManager`这个工具类中访问
 
 **/
extension AppPreferences {
    
//    /// 读取偏好存储中的`Token`
//    var token: Token? { AppPreferences.auth.tokenInformation }
//
//    /// 更新偏好存储中的`Token`
//    ///
//    /// - Note: 对外统一使用接口
//    ///
//    func update(tokenInfo: Token?) {
//        AppPreferences.auth.update(token_information: tokenInfo)
//    }
//
//    /// 读取偏好存储中的 `用户`信息
//    var user: User? { AppPreferences.user.userInformation }
//
//    /// 更新偏好存储中的`用户`信息
//    ///
//    /// - Note: 对外统一使用接口
//    ///
//    func update(userInfo: User?) {
//        AppPreferences.user.update(user_Information: userInfo)
//    }
}

// MARK: 私有

internal class AppPreferences {
    
    static let `default` = AppPreferences()
    
    // MARK: 日期相关缓存
    fileprivate static private(set) var date = BCRDate()
    
    
    fileprivate struct BCRDate {
        
        /// 更新`最近一次启动日期`
        ///
        /// - Note: 更新`launchDateLatest`属性
        ///
        fileprivate mutating func update(launchDateLatest: Date?) {
            self.launchDateLatest = launchDateLatest
            log.info("更新启动日期: \(launchDateLatest?.string(withFormat: DATE_FORMATTER_UNIVERSAL) ?? "")")
        }
        /// 更新`偏移量`
        ///
        /// - Note: 更新`server_date_offset`属性
        ///
        fileprivate mutating func update(serverDateOffset: Int) {
            self.serverDateOffset = serverDateOffset
        }
        /// 更新`最近一次请求服务器更新的日期`
        ///
        /// - Note: 更新`serverDateLatest`属性
        ///
        fileprivate mutating func update(serverDateLatest: Date?) {
            self.serverDateLatest = serverDateLatest
        }
        
        
        /// 最近一次请求服务器更新的日期 [请求或解析失败时为nil]
        private(set) var serverDateLatest: Date? {
            set { Defaults[\.SERVER_DATE_LATEST] = newValue }
            get { return Defaults[\.SERVER_DATE_LATEST] }
        }
        /// 偏移量
        private(set) var serverDateOffset: Int {
            set { Defaults[\.SERVER_DATE_LATEST_OFFSET] = newValue }
            get { return Defaults[\.SERVER_DATE_LATEST_OFFSET] }
        }
        /// 最近一次启动日期, 如果为`nil`, 代表首次启动
        private(set) var launchDateLatest: Date? {
            set { Defaults[\.PREVIOUS_LAUNCH_DATE] = newValue }
            get { return Defaults[\.PREVIOUS_LAUNCH_DATE] }
        }
    }
}


extension DefaultsKeys {
    
    /// 上一次的启动日期
    var PREVIOUS_LAUNCH_DATE: DefaultsKey<Date?>{ .init("previous_launch_date", defaultValue: nil) }
    /// 最近一次请求服务器获得的时间
    var SERVER_DATE_LATEST: DefaultsKey<Date?>{ .init("server_date_latest", defaultValue: nil) }
    /// 最近一次请求服务器获得的时间计算所得的偏移量
    var SERVER_DATE_LATEST_OFFSET: DefaultsKey<Int>{ .init("server_date_latest_offset", defaultValue: 0) }
}

