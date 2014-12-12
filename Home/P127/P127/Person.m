//
//  Person.m
//  P127
//
//  Created by 闫潇 on 14/12/7.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Person.h"

@implementation Person
-(NSString *)description
{
    return [NSString stringWithFormat:@"my name is %@,my age is %ld",self.name,self.age];
}

@end
