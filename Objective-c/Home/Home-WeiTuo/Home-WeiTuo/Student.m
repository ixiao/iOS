//
//  Student.m
//  Home-WeiTuo
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Student.h"
@interface Student ()
-(void)sayHi;






@end



@implementation Student
-(void)Work
{
    NSLog(@"学生开始上课");
}
-(NSString *)description
{
    [self sayHi];
    return [NSString stringWithFormat:@"你好，我叫%@，今年%ld岁了!",self.name,self.age];
}
-(void)sayHi
{
    NSLog(@"大家好");
}
@end

