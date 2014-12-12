//
//  main.m
//  OC-sjczo
//
//  Created by 徐赢 on 14-9-11.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    //1,有如下格式字符串，要求将其转换为键值对形势存入字典
    NSString * str = @"a=1|b=2|c=2";
    
    //2，有如下字典,将其转换为上述字符串形势
    NSDictionary * dic = @{@"a": @"1",@"b":@"2"};
    
    
    
    return 0;
}

