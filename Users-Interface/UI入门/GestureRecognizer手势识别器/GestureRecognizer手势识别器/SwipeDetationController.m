//
//  ViewController.m
//  GestureRecognizer手势识别器
//
//  Created by ibokan on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "SwipeDetationController.h"
#define kMinimumGestureLength 50 //手势最短距离
#define kMaximumVariance 10 //手势最大误差

@interface SwipeDetationController ()

@property (weak, nonatomic) IBOutlet UILabel *labelMessage;
@property (assign, nonatomic) CGPoint gestureStartPoint;//手势起始位置

@end

@implementation SwipeDetationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark 手势识别方法
// 触摸开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 获取手势起始点
    self.gestureStartPoint = [[touches anyObject]locationInView:self.view];
}
// 移动开始
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // 获取手势结束点
    CGPoint gestureEndPoint = [[touches anyObject]locationInView:self.view];
    // 获取x,y坐标的偏移量
    float deltaX = fabsf(gestureEndPoint.x - self.gestureStartPoint.x);
    float deltaY = fabsf(gestureEndPoint.y - self.gestureStartPoint.y);
    // 判断是横扫还是竖扫
    if ((deltaX > kMinimumGestureLength) && (deltaY < kMaximumVariance)) {
        self.labelMessage.text = @"发生了横扫!";
    } else if ((deltaY > kMinimumGestureLength) && (deltaX < kMaximumVariance)) {
        self.labelMessage.text = @"发生了竖扫!";
    }
}




@end
