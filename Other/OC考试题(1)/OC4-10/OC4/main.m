//
//  main.m
//  OC4
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>



int main(int argc, const char * argv[])
{

    /*
     有如下字符串，通过代码将以|符号分割成数组，
     */
//    NSString * str = @"123|456|567|axg|faeffga|a4g";
//    NSArray *arr=[str componentsSeparatedByString:@"|"];
//    NSLog(@"%@",arr);
    
    
    
    
    /*
     有如下字符串，通过代码，将以&分割的每个等式，作为字典的键值对
     */
    NSString * str1 = @"a=1&b=2&c=3&ab=4";
    
    NSMutableDictionary *dic=[NSMutableDictionary dictionaryWithCapacity:20];
    NSMutableArray *arr1=[[str1 componentsSeparatedByString:@"&"]mutableCopy];
    for(id obj1 in arr1)
    {
        NSArray *arr2=[obj1 componentsSeparatedByString:@"="];
        [dic setObject:arr2[1] forKey:arr2[0]];
    }
    NSLog(@"%@",dic);

    
    
    
    
    
    
    
    
    
    
    return 0;
}

