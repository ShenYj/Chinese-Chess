//
//  BaseViewModel.swift
//  
//
//  Created by ShenYj on 2021/08/12.
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

import RxCocoa
import RxSwift
import PPILibrary

public class BaseViewModel: NSObject {
    
    let loading = ActivityIndicator()
    let error = ErrorTracker()
    let dialogSubject = PublishSubject<Dialog>()
    
    /// `页面即将出现时是否显示导航栏, 仅控制显隐, 并不负责提供一个导航控制器`
    private(set) var showNavigationBar: Bool = true
    
    init(showNavigationBar: Bool = true) {
        self.showNavigationBar = showNavigationBar
        super.init()
    }
    
    deinit {
        #if DEBUG
        log.logResourcesCount()
        #endif
    }
}

extension BaseViewModel: OpenURLable,
                         GetKeyWindowable,
                         Informationable,
                         ShowMessageable { }


public extension BaseViewModel {
    
    func pop(_ delay: TimeInterval = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            Router.default.navigate(transition: .pop(toRoot: false, destination: nil))
        }
    }
    
    func dismiss(_ delay: TimeInterval = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            Router.default.navigate(transition: .dismiss(source: nil, completion: nil))
        }
    }
}
