//
//  main.m
//  OC3
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSNumber+Add.h"
/*
 为NSNumber类增加一个类目
 
 类目中声明并实现一个方法
 -(NSNumber *)add:(NSNumber *)num;
 
 使用示例
 NSNumber * num1 = @1;
 NSNumber * num2 = @2;
 NSNumber * sum = [num1 add:num2];
 
 sum为两个数的和
 
 */
int main(int argc, const char * argv[])
{
    NSNumber *n1=@2;
    NSNumber *n2=@3;
    NSNumber *sum=[n1 add:n2];
    NSLog(@"%@",sum);
    
    return 0;
}

