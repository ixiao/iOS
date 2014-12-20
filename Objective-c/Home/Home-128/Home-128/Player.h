//
//  Player.h
//  OC-ywlj5
//
//  Created by 徐赢 on 14-9-11.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PBlock)(void);

@interface Player : NSObject

-(void)playWithURL:(NSString *)url;

-(void)setDidFinishBlock:(PBlock)aBlock;


@end
