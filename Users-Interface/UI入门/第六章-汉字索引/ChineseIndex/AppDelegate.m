//
//  AppDelegate.m
//  ChineseIndex
//
//  Created by hejin on 13-12-15.
//  Copyright (c) 2013年 e世雕龙. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.rootViewController = [[MainViewController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        [application setStatusBarStyle:UIStatusBarStyleLightContent];//iOS7状态栏一直保持黑底白字
        self.window.clipsToBounds = YES;//将超出window显示范围的子视图部分剪辑掉
        self.window.frame =  CGRectMake(0.0f,20.0f,self.window.frame.size.width,self.window.frame.size.height-20.0f);
    }
    //上面代码会使状态栏内容不见；解决方案：在info.plist文件中添加View controller-based status bar appearance项，设置为NO。
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
