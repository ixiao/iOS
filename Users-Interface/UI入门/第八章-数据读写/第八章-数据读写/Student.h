//
//  Student.h
//  第八章-归档
//
//  Created by 闫潇 on 15/1/6.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic,strong) NSString * name;//姓名
@property (nonatomic,assign) int age;//年龄
@property (copy,nonatomic) NSString * adress;//地址
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
