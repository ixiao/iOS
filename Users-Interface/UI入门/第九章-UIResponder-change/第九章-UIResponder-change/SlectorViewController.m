//
//  ViewController.m
//  第九章-UIResponder-change
//
//  Created by 闫潇 on 15/1/12.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "SlectorViewController.h"
#import "myView.h"
@interface SlectorViewController ()

@end

@implementation SlectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //打开多点触控,默认关闭
    self.view.multipleTouchEnabled=YES;
    
    myView * redView = [[myView alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
    redView.backgroundColor = [UIColor redColor];
    redView.name = @"红色视图";
    [self.view addSubview:redView];
    
    myView * blueView = [[myView alloc]initWithFrame:CGRectMake(20, 20, 160, 160)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.name = @"蓝色视图";
    [redView addSubview:blueView];
    
    myView * yellowView = [[myView alloc]initWithFrame:CGRectMake(20, 20, 120, 120)];
    yellowView.backgroundColor = [UIColor yellowColor];
    yellowView.name = @"黄色视图";
    yellowView.userInteractionEnabled=NO;//是否与用户交互
    [blueView addSubview:yellowView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 4个手势通知方法
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //检测轻击次数和有几个手指触摸了屏幕
//    NSUInteger  tapCount = [[touches anyObject]tapCount];
//    NSLog(@"轻击次数%ld",tapCount);
//    
//    NSUInteger  touchsCount = [touches count];
//    NSLog(@"%ld个手指触摸了屏幕",touchsCount);
//    
//}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
