//
//  NSNumber+myNumber.m
//  Demo123
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "NSNumber+myNumber.h"

@implementation NSNumber (myNumber)
-(NSNumber*)addNumber:(NSNumber *)aa
{
    int a = [aa intValue];
    int b = [self intValue];
    NSNumber * nu = [NSNumber numberWithInt:a+b];
    return nu;
}
@end
