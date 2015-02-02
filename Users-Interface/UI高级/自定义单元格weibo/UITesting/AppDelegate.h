//
//  AppDelegate.h
//  UITesting
//
//  Created by 徐赢 on 14-8-20.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <UIKit/UIKit.h>

//通过新浪微博接口请求数据并显示
//access_token用：2.00lnmhZFfC4SKD500ff8c7b3efduoD
//接口文档为：http://open.weibo.com/wiki/2/statuses/public_timeline
//需要显示每条微博的：发微博人昵称，发微博时间，微博正文，微博图片（如果有）
//排版自定，美观即可，但数据需要显示完整。
//具有下拉刷新功能

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
