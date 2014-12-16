//
//  Student.m
//  Block-Demo
//
//  Created by 闫潇 on 14/12/11.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Student.h"

@implementation Student
-(NSString *)description
{
    return [NSString stringWithFormat:@"my name is %@,my age is %ld",self.name,self.age];
}

@end
