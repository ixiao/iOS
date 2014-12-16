//
//  ViewController.m
//  VC-Demo
//
//  Created by 闫潇 on 14/12/12.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutlet UIButton *left;
@property (strong, nonatomic) IBOutlet UIButton *right;

@end

@implementation ViewController
//视图已经加载成功后调用1到N次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //给左边和右边的按钮绑定目标动作
    [self.left addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.right addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"视图加载成功");
}
//视图将要出现时调用1到N次
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"调用viewAppear将要出现");
    [super viewWillAppear:animated];
}
//视图已经出现时调用1到N次
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"调用viewdidAppear(已经出现)");
    [super viewDidAppear:animated];
}
//视图将要消失时调用1到N次
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"调用viewDidDisappear(将要消失)");
    [super viewDidDisappear:animated];
}
//视图已经加载成功后调用1次
-(void)viewDidLoad:(BOOL)animated
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //给左边和右边的按钮绑定目标动作
    [self.left addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.right addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"viewDidLoad已经加载成功");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark 点击左边的按钮，调用的方法
- (IBAction)tapButton:(UIButton *)sender {
    //改变label上面的文本信息
    self.label.text = [sender currentTitle];
}
-(void)touchButton:(UIButton *)sender
{
    self.label.text = [NSString stringWithFormat:@"%@被摸啦!",[sender currentTitle]];
}

@end
