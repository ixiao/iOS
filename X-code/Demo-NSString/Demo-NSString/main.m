//
//  main.m
//  Demo-NSString
//
//  Created by 闫潇 on 14/11/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSRange range = NSMakeRange(2, 6);
        NSLog(@"rang.location:%ld",range.length);
        NSString * str1 = @"hello world!hh";
        NSLog(@"str:%@",str1);
        NSString *str2 = [[NSString alloc]init];
        NSLog(@"str2:%@",str2);
        NSString *str3 = [NSString string];
        NSLog(@"str3:%@",str3);
        int i = 88;
        NSString * str4 = [NSString stringWithFormat:@"%@%d",str1,i];
        NSLog(@"str4%@",str4);
        NSString * str5 = [NSString stringWithString:str1];
        NSLog(@"str5:%@",str5);
        //比较两个字符串地址是否相等用“==”，比较两个字符串内容是否相等用“isEqualToString”实例方法
        NSLog(@"str1:%p,str5:%p",str1,str5);
        NSLog(@"str1 == str5:%@",str1=str5);
        const char *cStr ="大家好";
        NSString  * str6 = [NSString stringWithCString:cStr encoding:NSUTF8StringEncoding];
        NSLog(@"str6:%@",str6);
        NSUInteger  length =[str1 length];
        NSLog(@"str1长度是%ld",length);
        NSString *str11 = @"aaa.doc";
        if ([str11 hasSuffix:@".doc"])
        {
            NSLog(@"str11 是一个word文档");
        }
        else {
            NSLog(@"str11 不是一个word文档");
        }
        NSString * str12 =@"a.txt";
        if ([str12 hasPrefix:@"a."])
        {
            NSLog(@"str12 是一个a命名的文件");
        }
        else
            NSLog(@"str12 不是一个a命名的文件");
        NSString * str13 = @"888.88";
        double d = [str13 doubleValue];
        NSLog(@"%f:.2f",d);
        NSString * str14 = [str1 uppercaseString];
        NSLog(@"str14:%@",str14);
        NSString * str15 = [str1 lowercaseString];
        NSLog(@"str15:%@",str15);
        NSString * str16 = [str1 capitalizedString];
        NSLog(@"str16:%@",str16);
        NSString * str17 = @"I am a coder,I study in ibokan";
        NSLog(@"%@",str17);
//        NSString * str18 =[str17 stringByReplacingCharactersInRange:@"coder" withString:@"soft enigeer"];
        NSString * msg = @"我是一个快乐的人.";
        unichar uChar = [msg characterAtIndex:5];
        unichar uChars[10];
        uChars[0] = uChar;
        NSString * msg1 = [NSString stringWithCharacters:uChars length:1];
        NSLog(@"%@",msg1);
        [msg getCharacters:uChars range:NSMakeRange(4, 3)];
        msg1 = [NSString stringWithCharacters:uChars length:3];
        NSLog(@"%@",msg1);    }
    NSString * str19 =@"hejin";
    NSString * str20 =[str19 stringByAppendingFormat:@"%d",88];
    NSLog(@"str20:%@",str20);
    NSString * str21 =@"good man";
    str20 = [str19 stringByAppendingString:str21];
    NSLog(@"str20:%@",str20);
    str20 = [str21 substringFromIndex:6];
    NSLog(@"str20:%@",str20);
    str20 = [str21 substringToIndex:5];
    NSLog(@"str20:%@",str20);
    NSRange rangge1 =  NSMakeRange(2, 3);
    str20 = [str21 substringWithRange:rangge1];
    NSLog(@"%@",str20);
    NSString * str22 = @" h e l l o wor l d !";
    NSString * str23 =[str22 stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@",str23);
    NSMutableString * mStr = [NSMutableString stringWithCapacity:20];
    [mStr appendString:@"hello world"];
    NSLog(@"mStr:%@",mStr);
    [mStr appendFormat:@"%d",888];
//    NSMutableString *mStr = [NSMutableString stringWithCapacity:30];
//    [mStr appendString:@"hello world!"];
    NSLog(@"mStr内容：%@，地址：%p",mStr,mStr);
    for (int i=0; i<10; i++) {
        [mStr appendFormat:@"%d",i];
        NSLog(@"mStr内容：%@，地址：%p",mStr,mStr);
    return 0;
    }
}
