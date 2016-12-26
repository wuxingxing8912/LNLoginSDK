//
//  LNLoginSDK.m
//  LNLoginResource
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 YCGame. All rights reserved.
//

#import "LNLoginSDK.h"

static LNLoginSDK *_shareInstance = nil;
static dispatch_once_t onceToken;

@implementation LNLoginSDK{
    NSUserDefaults* defaults;//iOS 偏好设置类 用于存储键值对
    id<LNLoginDelegate>delegate; //代理
}

//初始化  设置回调代理
-(void)initData:(NSObject<LNLoginDelegate> *)loginDelegate
{
    defaults=[NSUserDefaults standardUserDefaults];
    delegate=loginDelegate; //设置代理
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(requestResult:) name:@"lnLoginResultNotify" object:nil];//注册接收通知
}

// 创建单例对象
+ (instancetype)sharedInstance {
    dispatch_once(&onceToken, ^{
        _shareInstance = [[self alloc] init];
    });
    return _shareInstance;
}

// 销毁单例对象
+ (void)attempDealloc {
    //    NSLog(@"attempDealloc");
    /**
     *  只有设置为0的时候 下次 dispatch_once 才会调用
     */
    onceToken = 0;
    _shareInstance = nil;
}

-(void)login:(UIViewController *)viewController
{
    fromViewController = viewController;
    //    NSBundle *bundle=[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"YCLoginSource" withExtension:@"bundle"]];
    UIStoryboard *loginSB = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    UIViewController *loginVC = [loginSB instantiateViewControllerWithIdentifier:@"LoginView"];
    [[viewController navigationController]pushViewController:loginVC animated:(true)];
}

// 注销
-(void) logout {
    // 清除登录数据
    [defaults setObject:@"" forKey:@"ln_aid"];
    [defaults setObject:@"" forKey:@"ln_sid"];
    [defaults synchronize];
    // 销毁单例
    [LNLoginSDK attempDealloc];
}

// 获取来源ViewController
-(UIViewController *)getFromViewController {
    return fromViewController;
}

//通知发送之后调用的方法 接收请求返回的结果
-(void)requestResult:(NSNotification*)notification
{
    //将请求成功的结果传给代理实现类
    [delegate lnLoginSuccess:notification.object];
}


@end
