//
//  main.m
//  OC9-10
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 现有以下数据，需要打包成一个数据对象
 name       score
 iPhone     99
 sony       50
 wp         70
 
 
 */

//int main(int argc, const char * argv[])
//{
//    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"iphone",@"99",@"sony",@"50",@"wp",@"70", nil];
//    [dic writeToFile:@"/Users/fantengfei/Desktop/IMG_1037.JPG" atomically:YES];
//    NSData *data=[NSData dataWithContentsOfFile:@"/Users/fantengfei/Desktop/IMG_1037.JPG"];
//    NSLog(@"%@",data);
//    return 0;
//}

int main(int argc, const char * argv[])
{
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:@"iphone",@"99",@"sony",@"50",@"wp",@"70", nil];
    [dic writeToFile:@"/Users/yanxiao/Desktop/2.JPG" atomically:YES];
    NSData * data= [NSData dataWithContentsOfFile:@"/Users/yanxiao/Desktop/2.JPG"];
    NSLog(@"%@",data);
}

