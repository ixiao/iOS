//
//  MyOperation.m
//  第十章-操作队列-story
//
//  Created by 闫潇 on 15/1/13.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "MyOperation.h"

@implementation MyOperation
#pragma mark 把操作对象放入操作队列中 启动线程会调用该方法
-(void)main
{
//    NSLog(@"操作%@被执行了！",self.name);
    NSLog(@"线程%@开始！",self.name);
    NSLog(@"----------------");
    [NSThread sleepForTimeInterval:5];
    NSLog(@"线程%@结束！",self.name);
}
@end
