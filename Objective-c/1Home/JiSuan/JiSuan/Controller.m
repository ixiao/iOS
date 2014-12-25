//
//  Controller.m
//  JiSuan
//
//  Created by 闫潇 on 14/11/16.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Controller.h"
#import "Calculator.h"
@implementation Controller
-(int)handData:(int)x andOther:(int)y
{
    if (x < 0 || y<0)
    {
        NSLog(@"不能为负数，请计算正数！");
        return -1;
    }
    else
    {
        
    
    Calculator * cal = [Calculator new];
    int rst = [cal addX:x andY:y];
    return rst;
    }
}
@end
