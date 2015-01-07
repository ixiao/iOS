//
//  ViewController.m
//  第八章-FileMannager
//
//  Created by 闫潇 on 15/1/5.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)fileWrite:(UIButton *)sender {
    //1、获取文件管理器（NSFileManager的类方法defaultManager：）
    NSFileManager * fileManager = [NSFileManager defaultManager];
    //2、检查文件是否存在（NSFileManager的实例方法fileExistsAtPath: ，参数是文件路径，需要调用方法获取）
    if (![fileManager fileExistsAtPath:[self getPath]conte]) {
        <#statements#>
    }
    //2.1、不存在此文件的话，创建该文件（NSFileManager的createFileAtPath: contents: attributes:实例方法）
    //3、写入文件内容，创建一个NSFileHandle，相当于打开（NSFileHandle的fileHandleForWritingAtPath:类方法）
    //4、写入内容（获取内容字符串，调用内容字符串的dataUsingEncoding:实例方法转换成NSData类型，调用NSFileHandle的实例方法writeData:写入文件）
    //5、写入完成之后关闭文件（调用NSFileHandle的实例方法closeFile:）
}
- (IBAction)fileRead:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
