//
//  BaseView.swift
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

public class BaseView: UIView, BaseViewType {
    
    /// 加载状态
    let isLoadingRelay = BehaviorRelay(value: false)

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        bindViewModel()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        bindViewModel()
    }
}

extension BaseView {
    
    /// 设置UI
    ///
    /// - Note: 在`viewDidLoad`中被调用
    ///
    @objc public func setupUI() {
        clipsToBounds = true
        backgroundColor = .white
    }
    
    /// 更新UI
    ///
    /// - Note: 在`viewDidLoad`中被调用
    ///
    @objc public func updateUI() {
        setNeedsDisplay()
    }
    
    /// 绑定`viewModel`
    ///
    /// - Note: 在`构造函数`中被调用
    /// - Note: 在`setupUI`之后被调用
    ///
    @objc public func bindViewModel() { }
}

extension BaseView {
    
    open func setPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        self.setContentHuggingPriority(priority, for: axis)
        self.setContentCompressionResistancePriority(priority, for: axis)
    }
}
