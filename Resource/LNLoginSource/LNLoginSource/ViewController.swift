//
//  ViewController.swift
//  LNLoginResource
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 YCGame. All rights reserved.
//

import UIKit

class ViewController: UIViewController,LNLoginDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    
    let loginSDK = LNLoginSDK()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginSDK.initData(self)
    }

    @IBAction func loginAction(_ sender: Any) {
        loginSDK.login(self)
    }

    @IBAction func logoutAction(_ sender: Any) {
        loginSDK.logout()
        resultLabel.text = "请登录";
    }
    
    // MARK: LNLoginDelegate
    func lnLoginSuccess(_ result: String!) {
        print("result: \(result!)")
        resultLabel.text = result!
    }
}

