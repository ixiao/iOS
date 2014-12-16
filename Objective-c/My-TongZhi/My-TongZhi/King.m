//
//  King.m
//  My-TongZhi
//
//  Created by 闫潇 on 14/12/9.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "King.h"
#import "Common.h"
@implementation King
-(void)senMessage
{
    NSNotification * notification = [NSNotification notificationWithName:MESSAGE object:self userInfo:@{@"message":@"国王万岁"}];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter]postNotification:notification];
    
}
@end
