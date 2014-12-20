//
//  Student.m
//  P127
//
//  Created by 闫潇 on 14/12/7.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Student.h"

@implementation Student
-(id)initWithName:(NSString *)aName andAge:(NSUInteger)anAge
{
    if (self=[super init])
    {
        _name=aName;
        _age =anAge
    }
}
@end
