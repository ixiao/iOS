//
//  ViewController.m
//  iOS-2-myAppdelege
//
//  Created by ibokan on 14/12/18.
//  Copyright (c) 2014年 @慕辰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//视图加载成功之后调用，视图控制器生命周期中仅仅调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    UIView *uiview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 150, 100)];
    uiview1.tag = 1001;
    uiview1.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:uiview1];
    UIView *uiview2 = [[UIView alloc]initWithFrame:CGRectMake(150, 100, 150, 100)];
    uiview2.tag = 1002;
    uiview2.backgroundColor = [UIColor redColor];
    //透明度:0.0为完全透明，1.0为不透明
    uiview2.alpha = 0.2;
    [self.view addSubview:uiview2];
    //改变UIView1的颜色为黑色
    [self changeColor];

}
#pragma mark 改变颜色私有方法
- (void)changeColor{
    UIView *view1 = [self.view viewWithTag:1001];
    view1.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
