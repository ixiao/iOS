//
//  Button.h
//  OC9
//
//  Created by 徐赢 on 14-6-9.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Button : NSObject

//设置回调的对象和方法
@property(weak,nonatomic)id target;
@property(assign,nonatomic)SEL action;

@end
