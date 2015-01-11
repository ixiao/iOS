//
//  Student.h
//  第八章-SBJSON-解析
//
//  Created by 闫潇 on 15/1/8.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (copy,nonatomic) NSString * name;//姓名
@property (assign,nonatomic) NSUInteger age;//年龄
@property (copy,nonatomic) NSString * gender;//性别
@property (copy,nonatomic) NSString * remark;//备注
@end
