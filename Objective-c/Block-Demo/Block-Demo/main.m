//
//  main.m
//  Block-Demo
//
//  Created by 闫潇 on 14/12/11.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#pragma 代码块排序
#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * stu1 = [Student new];
        stu1.name = @"小王";
        stu1.age=20;
        
        Student * stu2 = [Student new];
        stu2.name = @"小孙";
        stu2.age = 19;
        
        Student * stu3 = [Student new];
        stu3.name = @"小李";
        stu3.age = 21;
        
        NSArray * arr = [NSArray arrayWithObjects:stu1,stu2,stu3 ,nil];
        NSLog(@"--------排序前");
        for (id obj in arr) {
            NSLog(@"%@",obj);
        }
        //对不可变数组，用到了代码块
        arr = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2){
            Student * stu1 = obj1;
            Student * stu2 = obj2;
            NSComparisonResult result;
            if (stu1.age>stu2.age) {
                result = NSOrderedDescending;
                
            }
            else if (stu1.age<stu2.age)
            {
                result = NSOrderedAscending;
            }
            else
                result= NSOrderedSame;
            return result;
        }];
        NSLog(@"-----排序后");
        for (id obj in arr) {
            NSLog(@"%@",obj);
        }
    }
    return 0;
}
