//
//  main.m
//  NSDate-RiLi
//
//  Created by 闫潇 on 14/12/5.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate * now = [NSDate new];
        NSCalendar * calendar = [NSCalendar currentCalendar];
        NSDateComponents * dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                        fromDate:now];
        NSUInteger year = [dateComponents year];
        NSUInteger month = [dateComponents month];
        NSUInteger day = [dateComponents day];
        
        NSLog(@"%ld %ld %ld",year,month,day);
        NSTimeZone *systemzone = [NSTimeZone systemTimeZone];
        NSLog(@"%@",systemzone);
        NSString * abbr = [systemzone abbreviation];
        NSLog(@"abbr%@",abbr);
        //系统时区和本地时区的区别：系统时区不能修改，本地时区不能修改
        //获取世界所有时区
        NSArray * timeZones = [NSTimeZone knownTimeZoneNames];
        NSLog(@"%@",timeZones);
        [NSTimeZone setDefaultTimeZone:[[NSTimeZone alloc]initWithName:@"America/Chicago"]];
        
    }
    return 0;
}
