//
//  AuthManager.swift
//  CHChess
//
//  Created by ShenYj on 2021/8/17.
//

import Foundation
import SwifterSwift

/// 全局可用, 当前登录状态
let loggedInRelay = BehaviorRelay<Bool>(value: false)


extension AuthManager {
    
//    /// 对外暴露: 更新 `token`
//    static func setToken(token: Token) {
//        AuthManager.default.token = token
//    }
//
//    /// 对外暴露: 清空 `token`
//    static func removeToken() {
//        AuthManager.default.token = nil
//        AuthManager.default.user = nil
//    }
//
//    /// 对外暴露: 更新 `user`
//    static func setUser(user: User) {
//        AuthManager.default.user = user
//    }
//
//    /// 对外暴露: 清空 `user`
//    static func removeUser() {
//        AuthManager.default.user = nil
//    }
}


final class AuthManager {
    
    static let `default` = AuthManager()
    
//    /// 只有在调用`setToken(token:)`后才会触发
//    let tokenChangedSubject = PublishSubject<Token?>()
//    /// 只有在调用`setUser(user:)`后才会触发
//    let userChangedSubject = PublishSubject<User?>()
//
//    private(set) var token: Token? {
//        get {
//            AppPreferences.default.token
//        }
//        set {
//            /// 可以在此处做一些有效性验证
//            if let token = newValue {
//                AppPreferences.default.update(tokenInfo: token)
//            } else {
//                AppPreferences.default.update(tokenInfo: nil)
//            }
//            tokenChangedSubject.onNext(newValue)
//            loggedInRelay.accept(hasValidToken)
//        }
//    }
//
//    private(set) var user: User? {
//        get {
//            AppPreferences.default.user
//        }
//        set {
//            /// 可以在此处做一些有效性验证
//            if let user = newValue {
//                AppPreferences.default.update(userInfo: user)
//            } else {
//                AppPreferences.default.update(userInfo: nil)
//            }
//
//            userChangedSubject.onNext(newValue)
//        }
//    }
    
//    var hasValidToken: Bool { token?.token.isNilOrEmpty == false }
//    
//    init() {
//        
//        loggedInRelay.accept(hasValidToken)
//    }
    
}

