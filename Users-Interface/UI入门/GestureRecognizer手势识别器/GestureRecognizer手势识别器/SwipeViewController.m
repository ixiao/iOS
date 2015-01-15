//
//  SwipeViewController.m
//  GestureRecognizer手势识别器
//
//  Created by ibokan on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (strong, nonatomic) IBOutlet UILabel *labelMessage;


@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 创建手势识别器
    [self createGestureRecognizer];
}

#pragma mark 创建手势识别器
- (void)createGestureRecognizer {

    //1、创建手势识别器（关联方法）
    UISwipeGestureRecognizer *leftToRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeHandle:)];
    UISwipeGestureRecognizer *topToDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeHandle:)];
    //2、设置手势识别器属性(扫动方向)
    leftToRight.direction = UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    topToDown.direction = UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown;
    //3、注册手势识别器
    [self.view addGestureRecognizer:leftToRight];
    [self.view addGestureRecognizer:topToDown];
}
#pragma mark 识别手势调用的方法
- (void)swipeHandle:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == (UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft)) {
        self.labelMessage.text = @"检测到横扫!";
    } else if (recognizer.direction == (UISwipeGestureRecognizerDirectionDown |  UISwipeGestureRecognizerDirectionUp)) {
        self.labelMessage.text = @"检测到竖扫!";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
