//
//  AppDelegate.m
//  Home
//
//  Created by 闫潇 on 14-10-8.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIView * v1 = [[UIView alloc]init];
    [v1 setFrame:CGRectMake(60, 140, 200, 200)];
    [v1 setBackgroundColor:[UIColor redColor]];
    [self.window addSubview:v1];
    
    UIView * v2 = [[UIView alloc]init];
    [v2 setBounds:CGRectMake(20, 20, 180, 180)];
    [v2 setBackgroundColor:[UIColor blueColor]];
    [v2 setCenter:CGPointMake(160, 240)];
    [self.window addSubview:v2];
    
    //添加子视图时，对照的是父视图的坐标系
    
    UIView * v3 = [[UIView alloc]init];
    [v3 setBackgroundColor:[UIColor greenColor]];
    [v3 setFrame:CGRectMake(0, 0, 160, 160)];
    [v2 addSubview:v3];
    
    [v2 setCenter:CGPointMake(0, 0)];
    
    UILabel *hello = [UILabel ]
    return YES;
}


@end
