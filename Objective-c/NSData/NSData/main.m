//
//  main.m
//  NSData
//
//  Created by 闫潇 on 14/12/5.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //声明C类型字符串
        char * cString = "This is c String";
        // 写入缓冲区
        NSData * data = [NSData dataWithBytes:cString length:strlen(cString)+1];
        //写入文件
        [data writeToFile:@"/users/xiao/desktop/file.txt" atomically:YES];
        char * string1 = "this is String";
        NSMutableData * mData = [NSMutableData dataWithBytes:string1 length:StrLength(string1)];
        [mData writeToFile:@"/users/xiao/desktop/file.txt" atomically:YES];
        //NSString 和 NSData 之间的转换
        //NSString----->NSData
        NSString * str = @"你好，世界";
        NSData * strData =[str dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",strData);
        //NSData ------->NSString
        NSString * str2 =[[NSString alloc]initWithData:strData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str2);
    }
    return 0;
}
