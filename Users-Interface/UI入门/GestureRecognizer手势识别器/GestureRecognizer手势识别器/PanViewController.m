//
//  PanViewController.m
//  GestureRecognizer手势识别器
//
//  Created by 闫潇 on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *panView;
@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.panView.userInteractionEnabled=YES;
    [self creatGestureRecognizer];
    // Do any additional setup after loading the view.
}


#pragma mark  创建手势识别器
-(void)creatGestureRecognizer
{
    //创建手势识别器
    UIPanGestureRecognizer * panGestyreRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHandle:)];
    [self.view addGestureRecognizer:panGestyreRecognizer];
}
#pragma mark 手势识别方法
- (void)panHandle:(UIPanGestureRecognizer *)recognizer {
    //获取手势改变的点
    CGPoint translation = [recognizer translationInView:self.view];
    //改变图片的点
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y  + translation.y);
    //重置手势的坐标点
    [recognizer setTranslation:CGPointZero inView:self.view];
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
