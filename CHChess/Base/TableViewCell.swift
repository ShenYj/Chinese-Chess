//
//  TableViewCell.swift
//
//
//  Created by ShenYj on 2021/09/09.
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


public class TableViewCell: UITableViewCell, BaseType {
    
    public lazy private(set) var className: String = { type(of: self).description().components(separatedBy: ".").last ?? "" }()
    var cellDisposeBag = DisposeBag()
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        cellDisposeBag = DisposeBag()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    deinit {
        #if DoKit
        log.verbose(" DEINIT \(self.className) RxSwift.Resources: \(RxSwift.Resources.total)")
        #endif
    }
}

extension TableViewCell {
    
    @objc func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        layer.masksToBounds = true
        
        updateUI()
    }
    
    @objc func updateUI() { setNeedsDisplay() }
    
    @objc func bind(to viewModel: TableViewCellViewModel) { }
}
