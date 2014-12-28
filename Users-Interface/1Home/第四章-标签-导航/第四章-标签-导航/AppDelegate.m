//
//  AppDelegate.m
//  第四章-标签-导航
//
//  Created by 闫潇 on 14/12/27.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "AppDelegate.h"
#import "WeixinViewController.h"
#import "TongXunViewController.h"
#import "FaXianViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    // Override point for customization after application launch.
    //1.创建标签栏中的各个视图控制器,放入各个标签栏中
    WeixinViewController * WeiXinVC = [WeixinViewController new];
    TongXunViewController * TongXunLuVC = [TongXunViewController new];
    FaXianViewController * FaXianVC = [FaXianViewController new];

    //    创建标签栏控制器安，放入标签栏中
    UITabBarController * tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[WeiXinVC,TongXunLuVC,FaXianVC];
    
    //2.以导航控制器为根控制器，标签控制器作为导航控制器的根视图控制器时，各标签对应的视图控制器公用一个导航栈；
    UINavigationController * navigationController = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    
    self.window.rootViewController = navigationController;
    
    return YES;
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
