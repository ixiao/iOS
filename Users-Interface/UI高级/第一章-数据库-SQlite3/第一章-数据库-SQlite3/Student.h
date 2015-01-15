//
//  Student.h
//  第一章-数据库-SQlite3
//
//  Created by 闫潇 on 15/1/14.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (assign, nonatomic) int id;//id
@property (copy, nonatomic) NSString *name;//姓名
@property (assign, nonatomic) int age;//年龄
@end
