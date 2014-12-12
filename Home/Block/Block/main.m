//
//  main.m
//  Block
//
//  Created by 闫潇 on 14/12/8.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //参数是代码块的声明
        void useCodeBlock(int(^myBlock)(int x,int y));
        {
            int result =myBlock(10,30);//回调代码块
            NSLog(@"result=%d",result);
        };
        
        
        void(^myBlock)(NSString *);//代码块声明
        myBlock = ^(NSString * x)//赋值
        {
            NSLog(@"%@",x);
        };
        //代码块调用
        myBlock(@"hello World");
        
        //代码块声明的同时赋值
        void(^myBlock1)(NSString *)=^(NSString * x)
        {
            NSLog(@"%@",x);
        };
        myBlock1(@"haha");
        
        
        int(^add)(int,int)=^(int x, int y)
        {
            return x+y;
        };
        int result = add(5,6);
        NSLog(@"%d",result);
        
        //代码块声明的同时赋值
        void(^myBlock2)()=^()
        {
            NSLog(@"This is a void Block!");
        };
        myBlock2();
        //定义代码块
        int(^subtrack)(int,int)=^(int x,int y)
        {
            return x-y;
        };
        useCodeBlock(<#^int(int x, int y)myBlock#>)
    }
    return 0;
}
