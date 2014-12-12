//
//  Button.h
//  OC-ywljt
//
//  Created by 徐赢 on 14-9-11.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Button : NSObject
//给按钮添加文字
-(void)setTitle:(NSString *)title;
// 按钮点击时，调用target action指定的方法
-(void)addTapTarget:(id)target Action:(SEL)action;

@end
