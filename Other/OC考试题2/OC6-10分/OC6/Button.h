//
//  Button.h
//  OC6
//
//  Created by 徐赢 on 14-6-9.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Button : NSObject


//设置回调对象和方法
@property(nonatomic,assign)id target;
@property(nonatomic,assign)SEL action;



@end
