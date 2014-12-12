//
//  main.m
//  OC1
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
/*
 People：继承于NSOBject
 属性：name（字符串），age（int）
 方法：sayHello。打印自己的名字
 
 Student：继承与People
 属性：number（字符串）
 重写sayHello，打印自己的学号
 */
int main(int argc, const char * argv[])
{
    Person *p=[[Person alloc]init];
    p.name=@"姓名:范腾飞";
    NSLog(@"%@",p.name);
    
    Student *s=[[Student alloc]init];
    s.number=110104;
    NSLog(@"学号:%d",s.number);
    
    return 0;
}

