//
//  ZhongJie.h
//  WeiTuo
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SellFang.h"
#import "FangDong.h"
@interface ZhongJie : NSObject<SellFang>
@property (nonatomic,strong) FangDong *customer;
-(void)registerInfor:(FangDong *)aCustomer;
@end
