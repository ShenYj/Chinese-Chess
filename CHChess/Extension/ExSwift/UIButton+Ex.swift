//
//  UIButton+Ex.swift
//
//
//  Created by ShenYj on 2021/09/06.
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

import UIKit
import Rswift

extension UIButton {
    
    /// 导航返回按钮
    ///
    /// - Note:     深色
    ///
    /// - Returns:  导航返回按钮
    ///
    static func backBlackButton() -> UIButton {
        let btn = UIButton()
        //btn.setImage(R.image.back_black(), for: .normal)
        btn.setTitle("      ", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        return btn
    }
    
    /// 导航返回按钮
    ///
    /// - Note:     浅色
    ///
    /// - Returns:  导航返回按钮
    ///
    static func backWhiteButton() -> UIButton {
        let btn = UIButton()
        //btn.setImage(R.image.back_white(), for: .normal)
        btn.setTitle("     ", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        return btn
    }
    
}



let constBack2TopBtnSize: CGFloat = 40

extension UIButton {
    
    /// 列表返回顶部按钮
    ///
    /// - Returns:  列表返回顶部按钮
    ///
    static func back2TopButton() -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = constBack2TopBtnSize*0.5
        btn.layer.maskedCorners = .allCorner
        //btn.setBackgroundImage(R.image.back_to_top_Rocket(), for: .normal)
        btn.isHidden = true
        return btn
    }
}


extension UIButton {
    
    /// 搜索按钮
    ///
    /// - Returns:  搜索按钮
    ///
    static func searchButton() -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = .clear
        //btn.setImage(R.image.search(), for: .normal)
        return btn
    }
}

extension UIButton {
    
    /// 扫一扫按钮
    ///
    /// - Returns:  扫一扫按钮
    ///
    static func qrScanButton() -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = .clear
        //btn.setImage(R.image.icon_qr_scan_white(), for: .normal)
        return btn
    }
}

extension UIButton {
    
    /// 刷新按钮
    ///
    /// - Returns:  刷新按钮
    ///
    static func refreshButton() -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = .clear
        //btn.setBackgroundImage(R.image.refresh_circle_white(), for: .normal)
        return btn
    }
}

extension UIButton {
    
    /// 渐变色按钮
    ///
    /// - Returns:  蓝色
    ///
//    static func blueGradientBtn() -> UIButton {
//        let image = UIImage.size(CGSize(width: UIScreen.main.bounds.width, height: 48))
//            .color(gradient: [.bcr4A9AFC, .bcr4566E0], locations: [0, 1], from: CGPoint(x: 0, y: 0.0), to: CGPoint(x: 1, y: 0.0))
//            .image
//        let btn = UIButton()
//        btn.setTitle(" ", for: .normal)
//        btn.setTitleColor(.white, for: .normal)
//        btn.setTitleColor(.gray, for: .highlighted)
//        btn.titleLabel?.font = UIFont.SYS_BOLD_F18
//        btn.setBackgroundImage(image, for: .normal)
//        return btn
//    }
    
    /// 渐变色按钮
    ///
    /// - Returns:  橙色
    ///
//    static func orangeGradientBtn() -> UIButton {
//        let image = UIImage.size(CGSize(width: UIScreen.main.bounds.width, height: 48))
//            .color(gradient: [.bcrF5B95C, .bcrFF9B00], locations: [0, 1], from: CGPoint(x: 0, y: 0.0), to: CGPoint(x: 1, y: 0.0))
//            .image
//        let btn = UIButton()
//        btn.setTitle(" ", for: .normal)
//        btn.setTitleColor(.white, for: .normal)
//        btn.setTitleColor(.gray, for: .highlighted)
//        btn.titleLabel?.font = UIFont.SYS_BOLD_F18
//        btn.setBackgroundImage(image, for: .normal)
//        return btn
//    }
}

extension UIButton {
    
    /// 维修员角色的按钮
    ///
    /// - Returns:
    ///
    static func RepairOperateBtn() -> UIButton {
        let btn = UIButton()
        btn.setTitle(" ", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.gray, for: .highlighted)
        btn.titleLabel?.font = UIFont.SYS_F18
        return btn
    }
}


let captureButtonRadius = 40.0
extension UIButton {
    
    /// 拍照按钮
    ///
    /// - Returns: 拍照按钮
    ///
    static func captureBtn() -> UIButton {
        let btn = UIButton()
        btn.setCorner(radius: CGFloat(captureButtonRadius))
        btn.backgroundColor = .white
        btn.setBackgroundImage(UIImage(named: "whitecir"), for: .normal)
        return btn
    }
}
