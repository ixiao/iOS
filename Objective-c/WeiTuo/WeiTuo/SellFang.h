//
//  SellFang.h
//  WeiTuo
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SellFang <NSObject>
@required
-(void)saleHose;
//必须实现的付款方法
-(void)payMoney;

@end
