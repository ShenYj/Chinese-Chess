//
//  Configurations.swift
//  CHChess
//
//  Created by ShenYj on 2021/03/22.
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

// MARK: 头文件导入


@_exported import Dollar
@_exported import Rswift
@_exported import SwiftDate
@_exported import Foundation
@_exported import SwiftyJSON
@_exported import ObjectMapper
@_exported import SwifterSwift
@_exported import PPILibrary

/// Rx
@_exported import RxSwift
@_exported import RxRelay
@_exported import RxSwiftExt
@_exported import RxOptional
@_exported import NSObject_Rx



// MARK: 常量配置

/// 协议头分隔符
let SCHEME_SEPERATOR = "://"
/// 拨号服务 Scheme
let TEL_SCHEME = "tel\(SCHEME_SEPERATOR)"


/// 通用的日期格式 完整的
let DATE_FORMATTER_UNIVERSAL = "yyyy-MM-dd HH:mm:ss.SSS"
/// 通用的日期格式 日期
let DATE_FORMATTER_COMPACT_DATE = "yyyy-MM-dd"
/// 通用的日期格式 时间
let DATE_FORMATTER_COMPACT_TIME = "HH:mm:ss.SSS"

/// 应用名称
public var APP_NAME: String { JSON(Bundle.main.infoDictionary as Any).dictionaryValue["APP_NAME"]?.stringValue ?? "" }
/// AppScheme
public var APP_SCHEME: String { JSON(Bundle.main.infoDictionary as Any).dictionaryValue["APP_SCHEME"]?.stringValue ?? "" }
/// URL
public var API_BASE_URL: String { JSON(Bundle.main.infoDictionary as Any).dictionaryValue["API_BASE_URL"]?.stringValue ?? "" }

// MARK: 类型别名

typealias OpenURLHandler = (_ url: URL, _ options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool

