//
//  RootWindowConvertable.swift
//
//
//  Created by ShenYj on 2021/02/12.
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
import PPILibrary

public protocol RootWindowConvertible { }

extension RootWindowConvertible where Self: GetKeyWindowable {
    
    /// 切换根控制器
    ///
    /// - Note: 依赖类库`SwifterSwift`提供的方法
    ///
    public func changeRoot(controller: UIViewController, withNavigation: Bool = false) -> Void {
        guard withNavigation else { return _changeRoot(controller: controller) }
        let navigationController = BaseNavigationController(rootViewController: controller)
        _changeRoot(controller: navigationController)
    }
    
    
    /// 切换根控制器
    ///
    /// - Note: 依赖类库`SwifterSwift`提供的方法
    ///
    fileprivate func _changeRoot(controller: UIViewController) -> Void {
        appKeyWindow?
            .switchRootViewController(to: controller,
                                      animated: true,
                                      duration: 0.25,
                                      options: .transitionCrossDissolve,
                                      nil)
    }
}
