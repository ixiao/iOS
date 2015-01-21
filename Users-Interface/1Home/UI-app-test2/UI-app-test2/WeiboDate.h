//
//  WeiboData.h
//  UI-app-test2
//
//  Created by 闫潇 on 15/1/17.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboDate : NSObject
//解析新浪微博日期的方法
+ (NSString*)resolveSinaWeiboDate:(NSString*)dateStr;

@end
