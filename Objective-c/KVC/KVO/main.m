//
//  main.m
//  KVO
//
//  Created by 闫潇 on 14/12/9.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Engine.h"
#import "Car.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * stu = [Student new];
        [stu setValue:@"张三" forKey:@"name"];
        [stu setValue:@20 forKey:@"age"];
        NSLog(@"my name is %@,my age is %@",[stu valueForKey:@"name"],[stu valueForKey:@"age"]);
//        通过kVC的键路径来访问类的实例变量
        Engine * engine = [Engine new];
        Car * car = [Car new];
        [car setValue:engine forKey:@"engine"];
        [car setValue:@"宝马" forKey:@"engine.name"];
        NSLog(@"");
     }
    return 0;
}
