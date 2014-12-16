//
//  main.m
//  NSNumberNSValueNSnull
//
//  Created by 闫潇 on 14/11/28.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //基本数据类型转化为字符型
        int i = 10;
        NSNumber * numberInt = [NSNumber numberWithInt:i];
        float f  = 10.1;
        NSNumber *numberFloat = [NSNumber numberWithFloat:f];
        BOOL  b = YES;
        NSNumber * numberBool = [NSNumber numberWithBool:b];
        NSArray * arr = @[numberBool,numberFloat,numberInt];
//        for (id obj in arr)
//        {
//            NSLog(@"%@",obj);
//        }
        i = [arr[0] intValue];//字符型转化为基本数据类型
        NSLog(@"%d",i);
        
        //结构体与基本数据对象的拆分
        NSRect  rect = NSMakeRect(10, 10, 30, 60);
        NSValue * value = [NSValue valueWithBytes:&rect objCType:@encode(NSRect)];
        NSArray * arr2 = @[value];
        NSLog(@"%@",arr2);
        NSRect rec1;
        [value getValue:&rec1];
        NSLog(@"%f %f %f %f",rec1.origin.x,rec1.origin.y,rec1.size.height,rec1.size.width);
//        NSNull的基本用法
        NSNull * null = [NSNull null];
        
        NSArray * arr3 = [NSArray arrayWithObjects:@"hello",@"world",null,@"haha", nil];
        NSLog(@"%@",arr3);
        
        //数组排序
        Student *  stu1 = [Student new];
        stu1.name = @"李雅梅";
        stu1.age = 28;
        Student * stu2 = [Student new];
        stu2.name = @"范腾飞";
        stu2.age = 16;
        Student * stu3 =[Student new];
        stu3.name = @"牛少帅";
        stu3.age =21;
        Student * stu4 =[Student new];
        stu4.name = @"刘恒槟 王树刚";
        stu4.age =21;
        
        NSMutableArray * mArr = [NSMutableArray arrayWithObjects:stu1,stu2,stu3,stu4, nil];
//        定义一个排序描述对象   按学生对象的年龄升序排序
        
        NSSortDescriptor * sourtdescriptor = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES];
        for (id obj in mArr) {
            NSLog(@"%@",obj);
        }
        NSLog(@"------排序");
        NSArray * arr4 = @[sourtdescriptor];
        [mArr sortUsingDescriptors:arr4];
//        [mArr sortedArrayUsingDescriptors: arr4];//不可变数组的排序方法 edArrar
        for (id obj in mArr) {
            NSLog(@"%@",obj);
        }
//        sortUsingSelector 方法排序可变数组
        NSMutableArray * mArr1 = [NSMutableArray arrayWithObjects:@"zhangsan",@"lisi",@"wangwu",@"maliu", nil];
        [mArr1 sortUsingSelector:@selector(compare:)];
        for (id obj in mArr1) {
            NSLog(@"%@",obj);
            
        }
        mArr sortUsingComparator:^
        [NSComparisonResult(id obj1,id obj2)
        {
            Student * stud1 = obj1;
            Student * stud2 = obj2;
            NSComparisonResult result;
            if
        };
        
    }
    return 0;
}
