//
//  ViewController.m
//  第四章-多视图
//
//  Created by 闫潇 on 14/12/24.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "rootViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"
@interface rootViewController ()
@property (nonatomic,strong) YellowViewController * yellow;
@property (nonatomic,strong) BlueViewController * blue;
@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建界面控件
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height-44, 320, 44)];
    //创建工具栏按钮
    UIBarButtonItem * switchButton = [[UIBarButtonItem alloc]initWithTitle:@"切换视图" style:UIBarButtonItemStyleBordered target:self action:@selector(doBarButonItem:)];
    //把按钮加入工具栏
    toolbar.items = @[switchButton];
    //把工具加入视图
    [self.view addSubview:toolbar];
    //创建黄色和蓝色视图控制器
    self.yellow = [YellowViewController new];
    self.blue = [BlueViewController new];
    //设置黄色视图控制器的视图为初始视图
    [self.view  insertSubview:self.yellow.view atIndex:0];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)doBarButonItem:(UIBarButtonItem *)sender {
    if (self.yellow.view.superview == nil) {
        [self.blue.view removeFromSuperview];
        [self.view insertSubview:self.yellow.view atIndex:0];
    } else {
        [self.yellow
         .view removeFromSuperview];
        [self.view insertSubview:self.blue.view atIndex:0];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
