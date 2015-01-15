//
//  AddViewController.m
//  GestureRecognizer手势识别器
//
//  Created by 闫潇 on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *addImg;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addImg.userInteractionEnabled =YES;
    [self creatGestureRecognizer];

    // Do any additional setup after loading the view.
}


#pragma mark 一个视图可以同时响应多个手势的方法
-(void)creatGestureRecognizer
{
    //创建捏合手势识别器
    UIPinchGestureRecognizer * pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinHandle:)];
    [self.addImg addGestureRecognizer:pinchGestureRecognizer];
    //创建旋转手势识别器
    UIRotationGestureRecognizer * rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rouHandle:)];

    [self.addImg addGestureRecognizer:rotationGestureRecognizer];
    //注册捏合手势识别器
    
    
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
#pragma mark 缩放比例的方法
-(void)pinHandle:(UIPinchGestureRecognizer *)recognizer
{
    //捏合时保持图片位置不变
    CGPoint location = [recognizer locationInView:self.view];
    recognizer.view.center = CGPointMake(location.x, location.y);
    //通过手势的缩放比例改变图片的仿射变换矩阵
    recognizer.view.transform=CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    //重置缩放比例
    recognizer.scale=1;
}
#pragma mark 旋转图片的方法
-(void)rouHandle:(UIRotationGestureRecognizer *)recognizer
{

    //改变手势view的仿射变换矩阵
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    //重置弧度
    recognizer.rotation = 0;

}

//- (void)panHandle:(UIPanGestureRecognizer *)recognizer {
//    //获取手势改变的点
//    CGPoint translation = [recognizer translationInView:self.view];
//    //改变图片的点
//    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y  + translation.y);
//    //重置手势的坐标点
//    [recognizer setTranslation:CGPointZero inView:self.view];
//}
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
