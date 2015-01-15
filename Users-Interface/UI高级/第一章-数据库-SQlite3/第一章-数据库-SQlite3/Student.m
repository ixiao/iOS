//
//  Student.m
//  第一章-数据库-SQlite3
//
//  Created by 闫潇 on 15/1/14.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "Student.h"

@implementation Student
- (NSString *)description
{
    return [NSString stringWithFormat:@"my id is %@ my name is %d,my age is %d", self.name,self.id,self.age];
}
@end
