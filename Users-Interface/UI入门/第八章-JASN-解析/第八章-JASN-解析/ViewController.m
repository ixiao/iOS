//
//  ViewController.m
//  第八章-JASN-解析
//
//  Created by 闫潇 on 15/1/8.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self passJSON];
    // Do any additional setup after loading the view, typically from a nib.
}

//options参数含义：
//第二个参数为一个枚举类型：NSJSONReadingOption
//有三个值可选，也可以使用|组合这三个值中的任意几个
//1：NSJSONReadingMutableContainers 获取的数组或字典为可变的
//2：NSJSONReadingMutableLeaves 获取的叶子数据为可变字符串
//3：NSJSONReadingAllowFragments 允许获取的可以不是字典或数组
#pragma mark 解析JSON
-(void)passJSON
{
    //获取JSON文件路径
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"person" ofType:@"json"];
    //把JSON文件读取到NSData
    NSError * error = nil;
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"error:%@",[error localizedDescription]);
    }
    else
    {
        NSLog(@"%@",dict);
    }
}

@end
