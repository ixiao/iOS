//
//  ViewController.m
//  SandBox
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
    //获取应用程序沙盒路径documents
    //获取应用程序沙盒路径library
    //获取应用程序沙盒路径tmp
    NSArray * docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docPath = docPaths[0];
    NSLog(@"docPath:%@",docPath);
    
    NSArray * libPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString * libPath = libPaths[0];
    NSLog(@"libPath:%@",libPath);
    
    NSString * tmpPath = NSTemporaryDirectory();
    NSLog(@"tmpPath:%@",tmpPath);
    
    NSString * bumdle = [NSBundle mainBundle];
    NSLog(@"%@",bumdle);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
