//
//  ViewController.m
//  第八章-UserDefualt
//
//  Created by 闫潇 on 15/1/6.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    NSArray * libraryPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString * libray = libraryPaths[0];
    NSLog(@"%@",libray);
    [self write];
    [self readUserDefault];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 写入UserDefault数据方法
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
#pragma mark 写入UserDefault数据方法
-(void)write
{
    //获取userDefault对象
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    //写入各种类型数据
    [userDefault setInteger:18 forKey:@"int"];
    [userDefault setFloat:18.f forKey:@"float"];
    [userDefault setDouble:18.0 forKey:@"double"];
    
    [userDefault setObject:@"hello world" forKey:@"string"];
    [userDefault setObject:[NSData data] forKey:@"now"];
    [userDefault setObject:@[@"a",@"b",@"c",@"d"] forKey:@"array"];
    [userDefault setObject:@{@"name":@"xiao",
                             @"age":@"18",
                             @"gender":@"man"} forKey:@"dict"];
}
#pragma mark 读出UserDefault数据方法
-(void)readUserDefault
{
    //获取userdefault对象
    NSUserDefaults * userdefault = [NSUserDefaults standardUserDefaults];
    //读取各种数据类型
    NSUInteger i = [userdefault integerForKey:@"int"];
    NSLog(@"%ld",i);
    
    float f = [userdefault floatForKey:@"float"];
    NSLog(@"%f",f);
    
    double d = [userdefault doubleForKey:@"double"];
    NSLog(@"d=%.2f",d);
    
    NSString * str = [userdefault stringForKey:@"string"];
    NSLog(@"%@",str);
    
    NSData * now = [userdefault dataForKey:@"now"];
    NSLog(@"%@",now);
    
    NSArray * array = [userdefault arrayForKey:@"array"];
    NSLog(@"%@",array);
    
    NSDictionary * dict = [userdefault dictionaryForKey:@"dict"];
    NSLog(@"%@",dict);
    
    
}
@end
