//
//  ZhongJie.m
//  WeiTuo
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ZhongJie.h"

@implementation ZhongJie
-(void)saleHose
{
    NSLog(@"我是中介，我替房东卖房子");
    [self payMoney];
}
-(void)payMoney
{
    NSLog(@" 房子已卖，请收钱");
    [self.customer payMoney];
    //通知房东收钱
    
}
-(void)registerInfor:(FangDong *)aCustomer
{
    self.customer=aCustomer;
    self.customer.delegate=self;
}
@end
