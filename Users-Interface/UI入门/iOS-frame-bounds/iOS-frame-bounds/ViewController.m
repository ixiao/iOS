//
//  ViewController.m
//  iOS-frame-bounds
//
//  Created by ibokan on 14/12/18.
//  Copyright (c) 2014年 @慕辰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//需要定制view而不用系统创建的view时可以重写此方法，此方法先于viewDidLoad方法调用
//- (void) loadView
//{
//    myView *myview = [[myview alloc]init];
//    self.view = myview;
//}



//视图加载成功后会调用，视图控制器生命周期中仅调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //在画布上画画
    //创建一个黄色的view ，贴在画布上
    UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    yellowView.backgroundColor = [UIColor yellowColor];
    //改变黄色view的bounds
    CGRect bounds = yellowView.bounds;
    bounds.origin = CGPointMake(30, 30);
    yellowView.bounds = bounds;
    
    [self.view addSubview:yellowView];
    //创建蓝色view贴在黄色view上
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(40, 40, 200-10-10, 200-10-10)];
    blueView.backgroundColor = [UIColor blueColor];
    [yellowView addSubview:blueView];
    //创建红色view贴在黄色view上
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200-10-10-20, 200-10-10-20)];
    redView.backgroundColor = [UIColor redColor];
    [yellowView addSubview:redView];
    
    //创建黑色view贴在黄色view
    UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200-10-10-20+5+5, 200-10-10-20+5+5)];
    blackView.backgroundColor = [UIColor blackColor];
    [yellowView insertSubview:blackView atIndex:1];
    //exchangeSubviewAtIndex：withSubviewAtIndex:交换两个视图的前后顺序
    [yellowView exchangeSubviewAtIndex:1 withSubviewAtIndex:2];
    
    
    //在view上创建button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    //指定button的frame
    button.frame = CGRectMake(20, 260, 100, 60);
    //指定button上的文本
    [button setTitle:@"我点 点 点你！ " forState:UIControlStateNormal];
    //指定button的target：action
    [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
    //贴在画布上
    [self.view addSubview:button];
}
#pragma mark 点击按钮执行的方法
- (void)tapButton:(UIButton *)sender
{
    CGRect frame = sender.frame;
    CGPoint point = frame.origin;
    point = CGPointMake(point.x + 10, point.y + 10);
    frame.origin = point;
    sender.frame = frame;
    if (sender.frame.origin.x >= 280 || sender.frame.origin.y >= 568) {
        sender.frame = CGRectMake(20, 240, 100, 60);
    }
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
