//
//  ViewController.swift
//  LNLoginResource
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 YCGame. All rights reserved.
//

import UIKit
import LNLoginKit

class ViewController: UIViewController,LNLoginDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    
    let loginSDK = LNLoginSDK()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginSDK.initData(self)
    }

    // 登录
    @IBAction func login(_ sender: Any) {
        // 调用登录接口
        loginSDK.login(self)
    }

    // 注销
    @IBAction func logout(_ sender: Any) {
        // 调用注销接口
        loginSDK.logout()
        resultLabel.text = "请登录";
    }
    
    // MARK: LNLoginDelegate
    func lnLoginSuccess(_ result: String!) {
        print("result: \(result!)")
        resultLabel.text = result!
    }
}

