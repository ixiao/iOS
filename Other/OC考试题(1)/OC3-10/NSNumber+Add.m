//
//  NSNumber+Add.m
//  OC3
//
//  Created by Fan Tengfei on 14-8-18.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import "NSNumber+Add.h"

@implementation NSNumber (Add)
-(NSNumber *)add:(NSNumber *)num
{
    int a=[self intValue];
    int b=[num intValue];
    int sum=a+b;
    NSNumber *result=[NSNumber numberWithInt:sum];
    return result;
}
@end
