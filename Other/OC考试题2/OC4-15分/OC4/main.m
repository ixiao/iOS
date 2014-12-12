//
//  main.m
//  OC4
//
//  Created by 徐赢 on 14-6-9.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Teacher.h"
int main(int argc, const char * argv[])
{

    //标注stu和tea使用的内存何时释放
    {
 
        Student * stu = [[Student alloc]init];
        {
            Teacher * tea = [[Teacher alloc]init];
            stu.tea  = tea;
            tea.stu = stu;
        }

    }

    //标注stu和tea使用的内存何时释放
    {
        __weak Student * stu = [Student student];
        __weak Teacher * tea = [Teacher teacher];
        
        tea.stu = stu;
        stu.tea = tea;
    }
    
    //标注stu和tea使用的内存何时释放
    {
        __autoreleasing Teacher * tea = [[Teacher alloc]init];
        @autoreleasepool
        {
            tea = nil;
        }
        
        Student * stu = [[Student alloc]init];
        {
            stu = nil;
        }
    }
    
    //下面写法会出现什么问题？如果改进？
    for (int i = 0; i < 100000; i++)
    {
        NSString * str = [NSString stringWithFormat:@"%d",i];
        NSLog(@"str = %@",str);
        
        
    }
    
    
    
    return 0;
}

