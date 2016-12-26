//
//  LNLoginSDK.h
//  LNLoginResource
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 YCGame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

// 代理的回调方法
@protocol LNLoginDelegate <NSObject>

// 登录成功
- (void)lnLoginSuccess:(NSString *)result;

@end

// 源ViewController
static UIViewController* fromViewController;

@interface LNLoginSDK : NSObject

// 单例
+ (instancetype)sharedInstance;

// 销毁单例对象
+ (void)attempDealloc;

//初始化，设置代理
- (void)initData:(NSObject<LNLoginDelegate> *)requestLoginDelegate;

// 登录
- (void)login:(UIViewController *) ViewController;

// 注销
- (void)logout;

// 获取来源ViewController
- (UIViewController *)getFromViewController;


@end
