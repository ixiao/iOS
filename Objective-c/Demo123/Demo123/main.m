//
//  main.m
//  Demo123
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSNumber+myNumber.h"
//为NSNumber添加一个类目方法
//-(NSNumber*)addNumber:(NSNumber *)num;
//功能如下
//NSNumber * num1 = [NSNumber numberWithInt:1];
//NSNumber * num2 = [NSNumber numberWithInt:2];
//NSNumber * sum = [num1 addNumber:num2];
//打印sum的值为3

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSNumber * num1 = [NSNumber numberWithInt:1];
        NSNumber * num2 = [NSNumber numberWithInt:2];
        NSNumber * sum = [num1 addNumber:num2];
        NSLog(@"%@",sum);
    }
    return 0;
}