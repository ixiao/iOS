//
//  Student.m
//  第二章-CoreData-Story
//
//  Created by 闫潇 on 15/1/15.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "Student.h"


@implementation Student
//代表coreData中数据模型的getter、setter方法由coreData生成，千万不要alloc数据模型对象，数据模型对象由coreData生成才有效
@dynamic id;
@dynamic name;
@dynamic age;
- (NSString *)description
{
    return [NSString stringWithFormat:@"id:%@,name:%@,age:%d", self.id,self.name,[self.age intValue]];
}
@end
