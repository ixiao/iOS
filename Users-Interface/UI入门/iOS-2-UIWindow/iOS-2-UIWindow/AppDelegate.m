//
//  AppDelegate.m
//  iOS-2-UIWindow
//
//  Created by ibokan on 14/12/18.
//  Copyright (c) 2014年 @慕辰. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];
    //能够漂浮（盖住）在状态栏上的Window
    self.window1 = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    self.window1.backgroundColor = [UIColor blueColor];
    self.window1.windowLevel = UIWindowLevelStatusBar;
    [self.window1 makeKeyAndVisible];
    //漂浮在最上面的Window
    self.window2 = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.window2.backgroundColor = [UIColor redColor];
    self.window2.windowLevel = UIWindowLevelStatusBar;
    [self.window2 makeKeyAndVisible];
    
    
    //创建UIView类的对象，相当于画布
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view.backgroundColor = [UIColor blackColor];
    [self.window addSubview:self.view];
    
    //在画布上画画
    UIView *uiview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 150, 100)];
    uiview1.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:uiview1];
    UIView *uiview2 = [[UIView alloc]initWithFrame:CGRectMake(150, 100, 150, 100)];
    uiview2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:uiview2];
    
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
