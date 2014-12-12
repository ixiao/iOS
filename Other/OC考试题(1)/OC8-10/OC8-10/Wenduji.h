//
//  Wenduji.h
//  OC8-10
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WendujiDelegate.h"

//当开启以后，温度发生变换时，会产生委托回调。
@interface Wenduji : NSObject

@property(nonatomic,weak)id<WendujiDelegate>delegate;

-(void)start;


@end
