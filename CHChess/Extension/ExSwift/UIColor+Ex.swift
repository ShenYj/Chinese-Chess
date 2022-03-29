//
//  UIColor+Ex.swift
//  
//
//  Created by ShenYj on 2021/03/29.
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

import Hue
import UIKit

/// ` 如果相近色越来越多, 可以放在一个Extension中`

// MARK: 彩色

public extension UIColor {
    
    /// `0x3065EF` 蓝色
    static let bcr4566E0 = UIColor(hex: "#4566E0")
    /// `0x2461F8` 蓝色
    static let bcr2461F8 = UIColor(hex: "#2461F8")
    /// `0x5584F7` 淡蓝色
    static let bcr5584F7 = UIColor(hex: "#5584F7")
    /// `0x4A9AFC` 淡蓝色
    static let bcr4A9AFC = UIColor(hex: "#4A9AFC")
    
    /// `0xFF9B00` 橙色
    static let bcrFF9B00 = UIColor(hex: "#FF9B00")
    /// `0xFF9B00` 淡橙色 筛选一级分类背景色
    static let bcrF5B95C = UIColor(hex: "#F5B95C")
    /// `0xFF8C00` 浅橙色 筛选一级分类文字高亮颜色
    static let bcrFF8C00 = UIColor(hex: "#FF8C00")
    /// `0xFFE1B2` 浅橙色 登录按钮禁用状态
    static let bcrFFE1B2 = UIColor(hex: "#FFE1B2")
}


public extension UIColor {
    
    /// `0xF74D69` 粉红色
    static let bcrF74D69 = UIColor(hex: "#F74D69")
    
    /// `0x32BA6C` 绿色 高电量
    static let bcr32BA6C = UIColor(hex: "#32BA6C")
    
    /// `0xF01C1C` 红色 低电量颜色
    static let bcrF01C1C = UIColor(hex: "#F01C1C")
    /// `0xFFF3F3` 红色
    static let bcrFFF3F3 = UIColor(hex: "#FFF3F3")
    /// `0xF56C6C` 红色
    static let bcrF56C6C = UIColor(hex: "#F56C6C")
    /// `0xFFF2F2` 红色
    static let bcrFFF2F2 = UIColor(hex: "#FFF2F2")
}


// MARK: 灰色、灰色相近

public extension UIColor {
    
    /// `0x9CA6BF` 灰色
    static let bcr9CA6BF = UIColor(hex: "#9CA6BF")
    /// `0x666666` 灰色
    static let bcr666666 = UIColor(hex: "#666666")
    /// `0xB1B1B1` 灰色
    static let bcrB1B1B1 = UIColor(hex: "#B1B1B1")
    /// `0xE3E4E5` 灰色
    static let bcrE3E4E5 = UIColor(hex: "#E3E4E5")
    /// `0x313131` 灰色
    static let bcr313131 = UIColor(hex: "#313131")
    /// `0xAEB9D6` 灰色
    static let bcrAEB9D6 = UIColor(hex: "#AEB9D6")
    /// `0xC9DEE1` 白灰
    static let bcrC9DEE1 = UIColor(hex: "#C9DEE1")
    /// `0x7C8E9F` 白灰
    static let bcr7C8E9F = UIColor(hex: "#7C8E9F")
    /// `0xEEF2F6` 浅灰
    static let bcrEEF2F6 = UIColor(hex: "#EEF2F6")
    /// `0x4E5F6F` 浅灰色
    static let bcr4E5F6F = UIColor(hex: "#4E5F6F")
    /// `0x303133` 深灰
    static let bcr303133 = UIColor(hex: "#303133")
    /// `0xF2F2F2` 灰色
    static let bcrF2F2F2 = UIColor(hex: "#F2F2F2")
    /// `0x77808A` 灰色
    static let bcr77808A = UIColor(hex: "#77808A")
    
}
