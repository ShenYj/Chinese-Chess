//
//  BaseViewController.swift
//  
//
//  Created by ShenYj on 2021/07/13.
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

import RxViewController
import PPILibrary
import RxSwift
import RxCocoa
import RxSwiftExt
import RxOptional

public class BaseViewController: UIViewController, BaseViewType {
    
    var viewModel: BaseViewModel?
    let isLoading = BehaviorRelay(value: false)
    
    public lazy private(set) var className: String = { type(of: self).description().components(separatedBy: ".").last ?? "" }()

    init(viewModel: BaseViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        #if RXSWIFT
        log.info("当前控制器: \(#function) \(self.className) RxSwift.Resources: \(RxSwift.Resources.total)")
        #endif
    }
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        #if RXSWIFT
        log.info("当前控制器: \(#function) \(self.className) RxSwift.Resources: \(RxSwift.Resources.total)")
        #endif
    }
    
    deinit {
        #if RXSWIFT
        log.warning("当前控制器: DEINIT: \(self.className) RxSwift.Resources: \(RxSwift.Resources.total)")
        #endif
    }
}


extension BaseViewController {
    
    /// 设置UI
    ///
    /// - Note: 在`viewDidLoad`中被调用
    ///
    @objc public func setupUI() {
        view.backgroundColor = .white
        view.clipsToBounds = true
    }
    
    /// 更新UI
    ///
    /// - Note: 在`viewDidLoad`中被调用
    ///
    @objc public func updateUI() {
        view.setNeedsDisplay()
    }
    
    /// 绑定`viewModel`
    ///
    /// - Note: 在`viewDidLoad`中被调用
    /// - Note: 在`setupUI`之后被调用
    ///
    @objc public func bindViewModel() {
        
        viewModel?.loading.asObservable()
            .bind(to: isLoading)
            .disposed(by: rx.disposeBag)
        isLoading.asDriver()
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible, rx.isLoading)
            .disposed(by: rx.disposeBag)
        rx.viewWillAppear
            .do(onNext: { log.debug("====>  viewWillAppear base [\($0)]") })
            .bind(to: rx.showNavigationBar)
            .disposed(by: rx.disposeBag)
    }
}

extension BaseViewController {
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        let fileName: String = #file
        log.warning( URL(fileURLWithPath: fileName).lastPathComponent + #function )
    }
}

extension Reactive where Base: BaseViewController {
    
    public var isLoading: Binder<Bool> {
        return Binder (base) { (controller, loading) in
            switch loading {
            case true:  controller.showHUD()
            case false: controller.dismissHUD(delay: 0.25)
            }
        }
    }
    
    public var universalDialog: Binder<Dialog> {
        return Binder(base) { (owner, dialog) in
            owner.show(universalDialog: dialog)
        }
    }
    
    public var showNavigationBar: Binder<Bool> {
        return Binder (base) { (controller, show) in
            controller.navigationController?.setNavigationBarHidden(!(controller.viewModel?.showNavigationBar ?? true), animated: true)
        }
    }
}
