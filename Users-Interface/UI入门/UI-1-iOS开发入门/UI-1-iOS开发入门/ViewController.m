//
//  ViewController.m
//  UI-1-iOS开发入门
//
//  Created by ibokan on 14/12/11.
//  Copyright (c) 2014年 @少帅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation ViewController
//视图记载成功后调用,视图控制器生命周期中仅调用一次.
- (void)viewDidLoad {
    NSLog(@"调用viewDidLoad!");
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //给左边和右边的按钮绑定目标动作
    [self.leftButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
}
//视图将要出现时调用,视图控制器生命周期中调用1~N次
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"调用viewWillAppear!");
    [super viewWillAppear:animated];
}
//视图已经出现时调用,视图控制器生命周期中调用1~N次
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"调用viewDidAppear!");
    [super viewDidAppear:animated];
}
//视图将要消失时调用,视图控制器生命周期中调用1~N次
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"调用viewWillDisAppear!");
    [super viewWillDisappear:animated];
}
//视图已经消失时调用,视图控制器生命周期中调用1~N次
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"调用viewDidDisAppear!");
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 点击左边的按钮调用的方法
//拖拽的方法
- (IBAction)tapButton:(UIButton *)sender {
    //改变label上面的文本
    self.myLabel.text = [NSString stringWithFormat:@"本次点击了%@",[sender currentTitle]];
}
//手写的方法
- (void)touchButton:(UIButton *)sender{
    //改变label上面的文本
    self.myLabel.text = [NSString stringWithFormat:@"您点击了%@",[sender currentTitle]];

}
@end
