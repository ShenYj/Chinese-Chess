//
//  NSNumber+Ex.swift
//
//
//  Created by ShenYj on 2021/06/10.
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

extension NSNumber {
    
    /// NSNumber转字符串,  保留两位精度,, 结尾
    ///
    /// - Note: 保留精度: 2位小数点
    /// - Note: 结尾
    ///
    var roundDownStringValue: String? {
        get {
            let decimalNumber = NSDecimalNumber(decimal: self.decimalValue)
            let roundDown = NSDecimalNumberHandler(roundingMode: .down,
                                                   scale: 2,
                                                   raiseOnExactness: false,
                                                   raiseOnOverflow: false,
                                                   raiseOnUnderflow: false,
                                                   raiseOnDivideByZero: false)
            let roundDownRechargeMoney = decimalNumber.rounding(accordingToBehavior: roundDown).doubleValue
            
            return self.floatValue.isNaN ? nil : String(format: "%.02f", roundDownRechargeMoney)
        }
    }
    
    /// NSNumber转字符串, 保留两位精度, 远离零方向舍入的舍入模式
    ///
    /// - Note: 保留精度: 2位小数点
    /// - Note: 远离零方向舍入的舍入模式
    ///
    var roundUpStringValue: String? {
        get {
            let decimalNumber = NSDecimalNumber(decimal: self.decimalValue)
            let roundDown = NSDecimalNumberHandler(roundingMode: .up,
                                                   scale: 2,
                                                   raiseOnExactness: false,
                                                   raiseOnOverflow: false,
                                                   raiseOnUnderflow: false,
                                                   raiseOnDivideByZero: false)
            let roundDownRechargeMoney = decimalNumber.rounding(accordingToBehavior: roundDown).doubleValue
            
            return self.floatValue.isNaN ? nil : String(format: "%.02f", roundDownRechargeMoney)
        }
    }
}
