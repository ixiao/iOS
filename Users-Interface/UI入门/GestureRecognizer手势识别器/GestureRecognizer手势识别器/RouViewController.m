//
//  RouViewController.m
//  GestureRecognizer手势识别器
//
//  Created by 闫潇 on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "RouViewController.h"

@interface RouViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *routationImg;

@end

@implementation RouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.routationImg.userInteractionEnabled=YES;
    [self creatGestureRecognizer];
    // Do any additional setup after loading the view.
}
#pragma mark 创建手势识别器
-(void)creatGestureRecognizer
{
    UIRotationGestureRecognizer *  rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationHandle:)];
    [self.routationImg addGestureRecognizer:rotationGestureRecognizer];
}

#pragma mark 手势识别方法
- (void)rotationHandle:(UIRotationGestureRecognizer *)recognizer {
    //改变手势view的仿射变换矩阵
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    //重置弧度
    recognizer.rotation = 0;
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
