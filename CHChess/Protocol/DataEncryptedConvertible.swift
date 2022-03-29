//
//  DataEncryptedconvertable.swift
//  
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

import ObjectMapper

protocol DataEncryptedConvertible { }

extension DataEncryptedConvertible {
    
    typealias S = String
    typealias D = Data
    
    /// 简单的字符串加密处理
    ///
    /// - Note: `1. base64 + 2. 转Data`
    ///
    func encryptedData(original: S?) -> D? {
        guard let original = original else { return nil }
        return original.base64Encoded?.data(using: .utf8)
    }
    
    /// 简单的字符串值解密处理
    ///
    /// - SeeAlso: `encryptedData(:)`
    ///
    func decipher(encryptedData: D?) -> S? {
        guard let encryptedData = encryptedData else { return nil }
        return String(data: encryptedData, encoding: .utf8)?.base64Decoded
    }
}


protocol ModelEncryptedConvertable: DataEncryptedConvertible {
    
    associatedtype M where M: Mappable
}

extension ModelEncryptedConvertable {

    /// 模型数据加密
    ///
    /// - Note: `1. 转String 2. base64 + 3. 转Data`
    ///
    func encryptedData(original: M?) -> D? {
        guard let original = original, let string = original.toJSONString() else { return nil }
        return encryptedData(original: string)
    }
    
    /// 模型数据解密
    ///
    /// - SeeAlso: `decipher(:)`
    ///
    func decipher(encryptedModelData: D?) -> M? {
        guard let decipherString = decipher(encryptedData: encryptedModelData) else { return nil }
        return M(JSONString: decipherString)
    }
}
