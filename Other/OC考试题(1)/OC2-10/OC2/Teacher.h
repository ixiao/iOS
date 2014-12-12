//
//  Teacher.h
//  OC2
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;
@interface Teacher : NSObject
@property(weak,nonatomic)Student * stu;
@end
