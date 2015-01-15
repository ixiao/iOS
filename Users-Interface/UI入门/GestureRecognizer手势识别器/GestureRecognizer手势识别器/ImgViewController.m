//
//  ImgViewController.m
//  GestureRecognizer手势识别器
//
//  Created by 闫潇 on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "ImgViewController.h"

@interface ImgViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //指定UIImageView 能够与用户交互
    self.imgView.userInteractionEnabled=YES;
//    self pinchHandle:
    
    [self creatGestureRecognizer];
    // Do any additional setup after loading the view.
}
#pragma mark 创建手势识别器
-(void)creatGestureRecognizer
{
    //创建捏合手势识别器
    UIPinchGestureRecognizer * pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchHandle:)];
    [self.imgView addGestureRecognizer:pinchGestureRecognizer];
}

#pragma mark 手势识别方法
- (void)pinchHandle:(UIPinchGestureRecognizer *)recognizer {
    //捏合时保持图片位置不变
    CGPoint location = [recognizer locationInView:self.view];
    recognizer.view.center = CGPointMake(location.x, location.y);
    //通过手势的缩放比例改变图片的仿射变换矩阵
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    //重置手势缩放比例
    recognizer.scale = 1;
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
