//
//  Student.m
//  KVO
//
//  Created by 闫潇 on 14/12/9.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Student.h"

@implementation Student
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.name = _name;
        self.age = _age;
    }
    NSLog(@"my name is %@  age is %ld",self.name,self.age);
    return self;
}
@end
