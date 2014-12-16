//
//  FangDong.h
//  WeiTuo
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SellFang.h"
@interface FangDong : NSObject<SellFang>
@property (strong,nonatomic) id<SellFang>delegate;

@end
