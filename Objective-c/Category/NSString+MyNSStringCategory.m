//
//  NSString+MyNSStringCategory.m
//  Category
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "NSString+MyNSStringCategory.h"

@implementation NSString (MyNSStringCategory)
-(NSString *)lengthAsNumber
{
    NSInteger length = [self length];
    NSNumber * number = [NSNumber numberWithInteger:length];
}
@end
