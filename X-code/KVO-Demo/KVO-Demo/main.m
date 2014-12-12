//
//  main.m
//  KVO-Demo
//
//  Created by 闫潇 on 14/12/11.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "StudenObserver.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * stu = [Student new];
        StudenObserver * stuObserver = [[StudenObserver alloc]initWithStudent:stu];
        [stuObserver stu];
        [stu setValue:@"小王" forKey:@"name"];
        [stu setValue:[NSNumber numberWithInt:18] forKey:@"age"];
        
        [stu setValue:@"小李" forKey:@"name"];
        [stu setValue:[NSNumber numberWithInt:19] forKey:@"age"];

    }
    return 0;
}
