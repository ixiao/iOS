//
//  AppDelegate.m
//  UI-1-iOS开发入门
//
//  Created by ibokan on 14/12/11.
//  Copyright (c) 2014年 @慕辰. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


//应用程序委托方法，应用加载成功后调用,通常在次方法里设置窗口和试图的初始化
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //如果完全手写代码在此方法中完成创建UIWindow对象（画框），指定根视图控制器(其中有画布)
    NSLog(@"调用application:didFinishLaunchingWithOptions!");
    return YES;
}
//应用程序委托方法，应用程序将要进入后台的时候调用
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"调用applicationWillResignActive!");
}
//应用程序委托方法，应用程序已经进入后台的时候调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"调用applicationDidEnterBackground!");
}
//应用程序委托方法，应用程序将要进入前台的时候调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"调用applicatonWillEnterForground!");
}
//应用程序委托方法，应用程序已经进入前台的时候调用
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"调用applicationDidBecomeActive!");
}
//程序中止（iOS4.0之后，只在某些特殊情况下被调，比如你的内存预警，操作系统准备强行退出你的程序时）
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"调用applicationWillTerminate!");
}

@end
