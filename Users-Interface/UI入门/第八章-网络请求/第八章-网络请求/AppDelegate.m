//
//  AppDelegate.m
//  第八章-网络请求
//
//  Created by 闫潇 on 15/1/7.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self checkNetwork];
    // Override point for customization after application launch.
    return YES;
}
#pragma mark 检查网络状态
-(void)checkNetwork
{
    //订阅网络连接状态发生改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged) name:kReachabilityChangedNotification object:nil];
    //进行internet连接检查
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    //开始监听连接状态
    [self.internetReachability startNotifier];
    //网络连接状态发生改变调用
    [self reachabilityChanged];
}
#pragma mark 接受到网络连接状态发生改变的通知后调用的方法
-(void)reachabilityChanged
{
    //获取网络连接状态
    NetworkStatus  netStatus = [self.internetReachability currentReachabilityStatus];
    NSString * msg = nil;
    switch (netStatus)
    {
        case NotReachable:
            msg=@"没有网络连接";
            break;
        case ReachableViaWiFi:
            msg=@"通过WIFI连接网络";
            break;
        case ReachableViaWWAN:
            msg=@"通过2G/3G/4G连接网络";
            break;
        default:
            break;
    }
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"网络连接状态" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
