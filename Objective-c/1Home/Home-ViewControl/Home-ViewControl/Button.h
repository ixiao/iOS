//
//  Button.h
//  OC-ywljt
//
//  Created by 徐赢 on 14-9-11.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Button : NSObject

-(void)setTitle:(NSString *)title;
-(void)addTapTarget:(id)target Action:(SEL)action;

@end
