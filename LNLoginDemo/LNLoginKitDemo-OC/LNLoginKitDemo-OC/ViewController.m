//
//  ViewController.m
//  LNLoginKitDemo-OC
//
//  Created by admin on 16/12/23.
//  Copyright © 2016年 LN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    LNLoginSDK *loginSDK;
    __weak IBOutlet UILabel *resultLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取单例
    loginSDK = [LNLoginSDK sharedInstance];
    // 初始化
    [loginSDK initData:self];
}

// 登录
- (IBAction)login:(id)sender {
    // 调用登录接口
    [loginSDK login:self];
}

// 注销
- (IBAction)logout:(id)sender {
    // 调用注销接口
    [loginSDK logout];
    resultLabel.text = @"请登录";
}

- (void)lnLoginSuccess:(NSString *)result {
    NSLog(@"result:%@",result);
    resultLabel.text = result;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
