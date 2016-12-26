//
//  LoginViewController.swift
//  LNLoginResource
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 YCGame. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    
    let loginSDK = LNLoginSDK()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func login(_ sender: Any) {
        let name = nameTextField.text!
        let password = passwordTextFIeld.text!
        if name.isEmpty {
            ToastUtil.show(parentView: self.view, message: "请输入用户名")
            return
        } else if password.isEmpty {
            ToastUtil.show(parentView: self.view, message: "请输入密码")
            return
        }
        // 这里作为演示，省略网络请求代码，直接返回解决
        let aid = "a1b23c4defrgk"
        let sid = "d1wed45edeade"
        // 保存到本地，用于自动登录
        let ud = UserDefaults.standard
        ud.set(aid, forKey: LN_AID)
        ud.set(sid, forKey: LN_SID)
        ud.synchronize()
        // 返回数据
        let result = "{\"aid\":\"\(aid)\",\"sid\":\"\(sid)\"}"
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "lnLoginResultNotify"), object: "\(result)")
        // 回到调用页面
        self.navigationController?.popToViewController(loginSDK.getFromViewController(), animated: true)
    }

}
