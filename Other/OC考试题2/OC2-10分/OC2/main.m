//
//  main.m
//  OC2
//
//  Created by 徐赢 on 14-6-9.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 */

int main(int argc, const char * argv[])
{

    NSString * str = @"test1|test2|iphone|...|ceshi";
    /*
    //|...|表示可能有多个|，个数未知
    //现在写代码完成如下要求
     1,按照|对字符串进行拆分，将|分割的部分存入放入数组
     
     2，用-替换字符串中的|，生成新的字符串
     
     3，将字符串中相邻两个分割的部分，转化成字典
     例如，字典的key是test1对应的value为test2
                    test2对应的value为iphone
                    ...
     
     

     */
    
    
    NSArray * arr = [str componentsSeparatedByString:@"|"];
    NSLog(@"%@",arr);
    NSString * str1 = [ str stringByReplacingOccurrencesOfString:@"|" withString:@"-"];
    NSLog(@"%@",str1);
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:10];
    for (int i = 0; i<5; i++) {
        
    }
    return 0;
}

