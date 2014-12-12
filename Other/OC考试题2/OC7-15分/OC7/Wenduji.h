//
//  Wenduji.h
//  OC7
//
//  Created by 徐赢 on 14-6-9.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WendujiDelegate;

@interface Wenduji : NSObject

@property(nonatomic,weak)id<WendujiDelegate>delegate;

@end


@protocol WendujiDelegate <NSObject>

@optional
-(void)wenduji:(Wenduji*)wd didChange:(int)wendu;

@end