//
//  WeiboData.m
//  UI-app-test2
//
//  Created by 闫潇 on 15/1/17.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "WeiboDate.h"

@implementation WeiboDate
#pragma mark 解析新浪微博中的日期
+ (NSString*)resolveSinaWeiboDate:(NSString*)dateStr{
    //新浪微博的日期格式化字符串，例如：Sun Sep 14 20:47:03 +0800 2014
    NSDateFormatter *iosDateFormater=[NSDateFormatter new];
    iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
    //必须设置，否则无法解析
    iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *date=[iosDateFormater dateFromString:dateStr];
    
    //目的格式
    NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
    [resultFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    return [self NSDateToNSString:date withFormatter:resultFormatter];
}
#pragma mark 日期转化为日期格式的字符串
+ (NSString*)NSDateToNSString:(NSDate*)date withFormatter:(NSDateFormatter*)formatter{
    NSString *dateString=[formatter stringFromDate:date];
    return dateString;
}
@end
