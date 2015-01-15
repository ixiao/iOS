//
//  LongPressViewController.m
//  GestureRecognizer手势识别器
//
//  Created by 闫潇 on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *longPView;

@end

@implementation LongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.longPView.userInteractionEnabled=YES;
    [self creatGestureRecognizer];
    // Do any additional setup after loading the view.
}

#pragma mark 创建手势识别器
-(void)creatGestureRecognizer
{
    //创建长按手势
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressHandle:)];
    //注册手势识别器
    [self.longPView addGestureRecognizer:longPress];
}
#pragma mark 手势识别方法
-(void)longPressHandle:(UILongPressGestureRecognizer *)recognizer
{
    //隐藏图片
    [self hideImage];
    [self performSelector:@selector(showImg) withObject:nil afterDelay:3.0f];
}
#pragma marl 隐藏图片的方法
-(void)hideImage
{
    self.longPView.hidden=YES;
}
#pragma  mark 显示图片的方法
-(void)showImg
{
    self.longPView.hidden=NO;
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
