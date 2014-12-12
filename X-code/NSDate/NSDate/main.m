//
//  main.m
//  NSDate
//
//  Created by 闫潇 on 14/12/5.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //获取当前系统日期时间
        NSDate * now = [NSDate date];
        NSDate * alsoNow = [NSDate new];
        NSLog(@"%@",now);
        NSLog(@"%@",alsoNow);
        //通过时间间隔创建NSDate
        NSDate * tomorrow = [[NSDate alloc]initWithTimeIntervalSinceNow:24*60*60];
        NSLog(@"%@",tomorrow);
        NSDate * yesteday = [[NSDate alloc]initWithTimeIntervalSinceNow:-24*60*60];
        NSLog(@"%@",yesteday);
        NSDate * anhou = [[NSDate alloc]initWithTimeIntervalSinceNow:9*60*60];
        NSLog(@"%@",anhou);
        //两个日期之间的时间差
        //当前时间跟一小时之前的时间差
        NSTimeInterval time = [now timeIntervalSinceDate:anhou];
        NSLog(@"%f",time);
        //日期比较，那个更早，哪个更晚
        NSDate * later = [now laterDate:anhou];
        NSLog(@"%@",later);
        NSDate * earlieDate = [anhou earlierDate:yesteday];
        NSLog(@"%@",earlieDate);
        //直接比较两个日期时间对象
        NSComparisonResult  result = [now compare:anhou];
        if (result==NSOrderedSame)
        {
            NSLog(@"now=anhou");
        }
        if (result==NSOrderedAscending)
        {
            NSLog(@"");
        }
        if (result==NSOrderedDescending)
        {
            NSLog(@"");
        }
        
        
    }
    return 0;
}
