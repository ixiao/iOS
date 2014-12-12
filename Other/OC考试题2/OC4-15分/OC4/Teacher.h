//
//  Teacher.h
//  OC4
//
//  Created by 徐赢 on 14-6-9.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;
@interface Teacher : NSObject

@property(strong,nonatomic)Student * stu;

+(id)teacher;

@end
