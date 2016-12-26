//
//  ToastUtil.swift
//  LNLoginSDK
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 YCGame. All rights reserved.
//

import Foundation

class ToastUtil: NSObject {

    // 提示信息
    static func show(parentView:UIView, message:String) {
        let hud = LNMBProgressHUD.showAdded(to: parentView, animated: true)
        
        hud.mode = LNMBProgressHUDMode.text // Shows only labels
        hud.label.text = message // 文本
        hud.margin = 10.0 // 文字与视图边缘间距
        hud.removeFromSuperViewOnHide = true // Removes the HUD from its parent view when hidden
        hud.isUserInteractionEnabled = false // 父窗体可响应touch事件
        
        // 设置自动隐藏的时间
        let min = 1 * Double(NSEC_PER_SEC)
        let popTime = DispatchTime.now() + Double(Int64(min)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: popTime) { () -> Void in
            hud.hide(animated: true)
        }
    }
    
}
