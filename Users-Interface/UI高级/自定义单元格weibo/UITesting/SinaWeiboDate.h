//
//  SinaWeiboDate.h
//  UITesting
//
//  Created by 何瑾 on 14-9-14.
//  Copyright (c) 2014年 e世雕龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SinaWeiboDate : NSObject

//解析新浪微博中的日期
+ (NSString*)resolveSinaWeiboDate:(NSString*)dateStr;

@end
