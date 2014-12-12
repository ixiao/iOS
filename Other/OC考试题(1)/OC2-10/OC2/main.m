//
//  main.m
//  OC2
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[])
{
    //下面代码有何内存问题，应该如何改正

    {
        Student * stu = [[Student alloc]init];
        Teacher * tea = [[Teacher alloc]init];
        
        stu.tea = tea;
        
        tea.stu = stu;
        
    }
    // 强引用,造成内存泄露;
    // 把声明里的strong 改成weak;
    
    
    
    return 0;
}

