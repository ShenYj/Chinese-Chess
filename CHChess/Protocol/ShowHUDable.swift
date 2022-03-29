//
//  ShowHUDable.swift
//
//
//  Created by ShenYj on 2021/8/16.
//

import SVProgressHUD

public protocol ShowHUDable {}

public extension ShowHUDable {
    
    func showHUD(_ maskType: SVProgressHUDMaskType = .clear, text: String = "加载中") {
        SVProgressHUD.setHapticsEnabled(false)
        SVProgressHUD.setCornerRadius(8)
        SVProgressHUD.show(withStatus: text)
    }
    
    func dismissHUD(delay: TimeInterval = 0.45) {
        SVProgressHUD.dismiss(withDelay: delay)
    }
    
    static func showHUD(_ maskType: SVProgressHUDMaskType = .clear, text: String = "加载中") {
        SVProgressHUD.setHapticsEnabled(false)
        SVProgressHUD.setCornerRadius(8)
        SVProgressHUD.show(withStatus: text)
    }
    
    static func dismissHUD() {
        SVProgressHUD.dismiss(withDelay: 0.45)
    }
}

