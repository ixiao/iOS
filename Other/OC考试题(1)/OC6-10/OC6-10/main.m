//
//  main.m
//  OC6-10
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 创建一个block对象
 其输入参数为两个int型变量
 返回值为两数之中最大值
 
 并调用该block变量，返回结果
 */
int main(int argc, const char * argv[])
{
//    int(^block)(int a,int b);
//    block=^(int a,int b)
//    {
//        if (a>b) {
//            NSLog(@"%d",a);
//            return a;
//        }
//        else
//        {
//            NSLog(@"%d",b);
//            return b;
//        }
//    };
//    block(3,5);
//    return 0;

    int(^block)(int a,int b);
    block=^(int a,int b)
    {
        if (a>b)
        {
            NSLog(@"%d",a);
            return a;
        }
        else
        {
            NSLog(@"%d",b);
            return b;
        }
        
    
    };
    block(3,5);
    return 0;

    
    
    
    
    
    
    
    
    
    



}





