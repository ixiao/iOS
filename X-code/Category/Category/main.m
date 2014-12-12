//
//  main.m
//  Category
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+MyNSStringCategory.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSString *str1 = @"da jia hao!";
        NSString *str2 = @"da jia hao ma?";
        NSString *str3 = @"da jia hen hao ma?";
        NSString *str4 = @"da jia fei chang hao ma?";
        NSNumber *str1Length = [str1 lengthAsNumber];
        NSNumber *str2Length = [str2 lengthAsNumber];
        NSNumber *str3Length = [str3 lengthAsNumber];
        NSNumber *str4Length = [str4 lengthAsNumber];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:5];
        [dic setObject:str1Length forKey:str1];
        [dic setObject:str2Length forKey:str2];
        [dic setObject:str3Length forKey:str3];
        [dic setObject:str4Length forKey:str4];
        NSLog(@"%@",dic);
        NSLog(@"====================");
        NSArray *keys = [dic allKeys];
        for (id key in keys)
        {
            NSLog(@"%@的长度[%@]",key,dic[key]);
        }
        
        
        
    }
    return 0;
}