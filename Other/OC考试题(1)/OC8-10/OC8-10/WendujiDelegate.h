//
//  WendujiDelegate.h
//  OC8-10
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Wenduji;
@protocol WendujiDelegate <NSObject>

-(void)wenduji:(Wenduji *)wd didChangeWd:(int)t;

@end
