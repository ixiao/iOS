//
//  AppDelegate.m
//  VC-Demo
//
//  Created by 闫潇 on 14/12/12.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//加载成功调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //如果完全手写代码，在此方法中创建UIWindow对象(画框),指定根视图控制器(其中有画布)
    NSLog(@"应用程序加载成功");
    return YES;
}
//应用程序委托方法,应用程序将要进入后台成功后调用
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"将要进入后台WillResignActive");
}
//应用程序委托方法，应用程序已经进入后台时调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"已经进入后台DidEnterBackground");
}
//应用程序委托方法,应用程序将要进入前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"将要进入前台WillEnterForeground");
}
//应用程序委托方法,应用程序进入前台时调用
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"进入前台DidBecomeActive");
}
//应用程序终止时调用
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"应用程序杀死WillTerminate");
}

@end
