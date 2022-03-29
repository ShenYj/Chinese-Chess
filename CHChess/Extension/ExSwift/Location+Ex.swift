//
//  Location+Ex.swift
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

import CoreLocation

extension CLLocationManager {
    
    var authorizationStringStatus: String {
        var string = "下次询问"
        switch authorizationEnumStatus {
        case .authorizedAlways:     string = "始终"
        case .authorizedWhenInUse:  string = "使用期间"
        case .notDetermined:        string = "下次询问"
        case .denied:               string = "明确禁用"
        case .restricted:           string = "受限并不可修改"
        @unknown default:           string = "未知状态"
        }
        return string
    }
    
    var authorizationEnumStatus: CLAuthorizationStatus {
        if #available(iOS 14.0, *) { return self.authorizationStatus }
        return CLLocationManager.authorizationStatus()
    }
    
    var isAuthorized: Bool { (authorizationEnumStatus == .authorizedAlways) || (authorizationEnumStatus == .authorizedWhenInUse) }
}

extension CLAuthorizationStatus {
    
    var statusString: String {
        var string = "下次询问"
        switch self {
        case .authorizedAlways:     string = "始终"
        case .authorizedWhenInUse:  string = "使用期间"
        case .notDetermined:        string = "下次询问"
        case .denied:               string = "明确禁用"
        case .restricted:           string = "受限并不可修改"
        @unknown default:           string = "未知状态"
        }
        return string
    }
}
