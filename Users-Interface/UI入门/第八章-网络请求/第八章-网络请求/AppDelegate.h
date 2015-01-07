//
//  AppDelegate.h
//  第八章-网络请求
//
//  Created by 闫潇 on 15/1/7.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) Reachability * internetReachability;

@end

