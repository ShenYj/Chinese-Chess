//
//  DateConvertable.swift
//  
//
//  Created by ShenYj on 2021/03/24.
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

public protocol DateConvertible { }


extension DateConvertible {
    
    /// 日期类型转换
    ///
    /// - Note: `Date`转`String`
    ///
    func universalDate(date: D) -> S {
        date.toString(.custom(DATE_FORMATTER_UNIVERSAL))
    }
    
    /// 日期类型转换
    ///
    /// - Note: `String`转`Date`
    /// - Note: `UTC`时区
    ///
    func universalDate(date: S) -> D? {
        date.toDate(DATE_FORMATTER_UNIVERSAL, region: .UTC)?.date
    }
}



extension DateConvertible {
    
    typealias D = Date
    typealias S = String
    
    /// 紧凑的时间格式字符串, 可用于拼接字符串中的时间描述
    ///
    /// - Note: `20201110125055`
    ///
    var compactDateString: String { Date().string(withFormat: "yyyyMMddHHmmss") }
}
