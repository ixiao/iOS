//
//  main.m
//  OC1
//
//  Created by 徐赢 on 14-6-9.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
/*
 
    创建一个Person类继承NSObject
    属性：name，age
    对象方法：sayhello
 
    创建一个Student类继承Person
    属性：group，score
    对象方法：study
    
    要求，student类，重写父类的sayhello方法，并且调用父类的sayhello方法
 
    方法中简单输出字符串即可
 
 */
int main(int argc, const char * argv[])
{
    Person * p = [Person new];
    [p sayHello];
    Student * s = [Student new];
    [s study];

    
    return 0;
}

