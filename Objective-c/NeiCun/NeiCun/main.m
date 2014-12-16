//
//  main.m
//  NeiCun
//
//  Created by 闫潇 on 14/12/2.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Teacher * tea = [Teacher new];
//        Student * stu = [Student new];
//        tea.stu=stu;
//        stu.tea=tea;
//        NSLog(@"hello");
        __autoreleasing Student * stu = nil;
        for (int i ; i<10000; i++)
        {
            @autoreleasepool {
                Student * stu = [Student new];
            }
        }
    
    }
    return 0;
}
