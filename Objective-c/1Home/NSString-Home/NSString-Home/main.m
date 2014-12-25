//
//  main.m
//  NSString-Home
//
//  Created by 闫潇 on 14/11/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        化一个NSMutableString的对象，然后将之前的NSString对象加入其中，然后再删除几个，要求使用NSRange结构体

        NSString * str1 = @"hello world";
        NSString * str2 = @"Hello World";
        if ([str1 isEqualToString:str2])
        {
            NSLog(@"字符串内容相等");
        }
        else
            NSLog(@"字符串内容不相等");
        if (str1 == str2)
        {
            NSLog(@"字符串地址相同");
        }
        else
            NSLog(@"字符串地址不相同");
        switch ([str1 compare:str2])//区分大小写  比较的是ASCII码大小
        {
            case NSOrderedSame:
                NSLog(@"相等");
                break;
            case NSOrderedAscending:
                NSLog(@"升序");
                break;
            case NSOrderedDescending:
                NSLog(@"降序");
                break;
                
            default:
                break;
        }
        if ([str1 compare:str2 options:NSCaseInsensitiveSearch] ==NSOrderedSame)
        {
            NSLog(@"这两个字符串在不区分大小写的情况下相等");
        }
        NSMutableString * mStr = [NSMutableString stringWithCapacity:20];
        [mStr appendString:@"Hello World"];
        NSLog(@"%@",mStr);
        if ([str2 isEqualToString:mStr])
        {
            NSLog(@"字符串大小相等");
        }
        [mStr insertString:@" haha" atIndex:11];
        NSLog(@"%@",mStr);
        [mStr deleteCharactersInRange:NSMakeRange(11, 4)];
        NSLog(@"%@",mStr);
        NSRange  range = [mStr rangeOfString:@"Hello"];
        [mStr deleteCharactersInRange:range];
        NSLog(@"%@",mStr);
//        编写程序，将”Hello World and Sunshine.”字符串中的”World”替换为”iBokanWisdom”，并将替换前和替换后的字符串输出

        NSString * str3 = @"Hello World and Sunshine.";
        NSString * str4 = [str3 stringByReplacingOccurrencesOfString:@"World" withString:@"iBoKanWisdom"];
        NSLog(@"%@",str4);
        NSString * str5 = [str3 stringByReplacingCharactersInRange:NSMakeRange(6, 5) withString:@"iBoKanWisdom"];
        NSLog(@"%@",str5);
        
//        现有如下定义的字符串： NSMutableString * str=@“iphoneAndroid”,能不能对该字符串进行修改，如果能，请输出删除Android后的新字符串。
        NSMutableString * mStr1 = [NSMutableString stringWithCapacity:20];
        [mStr1 appendString:@"iphoneAndroid"];
//        NSRange rang  =[mStr1 rangeOfString:@"Android"];
//        [mStr1 deleteCharactersInRange:rang];
        [mStr1 deleteCharactersInRange:NSMakeRange(6, 7)];
        NSLog(@"%@",mStr1);
//        NSMutableString * str=@"iphoneAndroid";
//        NSLog(@"%@",str);
//        求字符串“158”和“39”按十进制数值做差后的结果以字符串形式输出
        NSString *str6 = @"158";
        NSString *str7 = @"39";
        int c = [str6 intValue];
        int d = [str7 intValue];
        NSString * str8 = [NSString stringWithFormat:@"%d",(c-d)];
        NSLog(@"%@",str8);
    }
    
    
    return 0;
}
