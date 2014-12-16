//
//  Farmer.m
//  My-TongZhi
//
//  Created by 闫潇 on 14/12/9.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Farmer.h"
#import "Common.h"
@implementation Farmer
//在初始化方法中订阅通知
- (instancetype)init
{
    self = [super init];
    if (self) {
        //通过通知中心订阅通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(doSomething:) name:MESSAGE object:nil];
    }
    return self;
}
//收到通知后执行的方法
-(void)doSomething:(NSNotification *)notifacation
{
    //从通知对象中获取通知内容
    NSDictionary * dic = [notifacation userInfo];
    NSString * message = dic[@"message"];
    NSLog(@"农民说:%@",message);
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MESSAGE object:nil];
}
//在dealloc方法中移除通知
@end
