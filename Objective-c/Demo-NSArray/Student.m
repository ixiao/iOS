//
//  Student.m
//  Demo-NSArray
//
//  Created by 闫潇 on 14/11/27.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Student.h"

@implementation Student

-(NSString *)description
{
    return [NSString stringWithFormat:@"my name is %@, my age is %ld",_name,self.age];
}
@end
