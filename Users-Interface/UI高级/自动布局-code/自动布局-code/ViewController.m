//
//  ViewController.m
//  自动布局-code
//
//  Created by 闫潇 on 15/2/2.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView * view1;
@property (nonatomic,strong) UIView * view2;
@property (nonatomic,strong) UIView * view3;
@property (nonatomic,strong) UIView * view4;
@property (nonatomic,strong) UIView * view5;
@property (nonatomic,strong) UISlider * slider;
@property (nonatomic,strong) NSLayoutConstraint * view1WidthC;//view1 宽度约束
@property (nonatomic,strong) NSLayoutConstraint * view1HeigthC;//view1 高度约束
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self onCreat];
}

#pragma mark 创建界面控件 添加约束
-(void)onCreat
{
    //创建界面控件
    self.view1 = [[UIView alloc]initWithFrame:CGRectZero];
    //设置需要使用autolayout空间的AutoResizing为NO
    self.view1.translatesAutoresizingMaskIntoConstraints=NO;
    self.view1.backgroundColor = [UIColor redColor];
    
    
    self.view2 = [[UIView alloc]initWithFrame:CGRectZero];
    //设置需要使用autolayout空间的AutoResizing为NO
    self.view2.translatesAutoresizingMaskIntoConstraints=NO;
    self.view2.backgroundColor = [UIColor redColor];
    
//    self.view3 = [[UIView alloc]initWithFrame:CGRectZero];
//    self.view3.translatesAutoresizingMaskIntoConstraints=NO;
//    self.view3.backgroundColor = [UIColor redColor];
//    
//    self.view4 = [[UIView alloc]initWithFrame:CGRectZero];
//    self.view4.translatesAutoresizingMaskIntoConstraints=NO;
//    self.view4.backgroundColor = [UIColor redColor];
//    
//    self.view5 = [[UIView alloc]initWithFrame:CGRectZero];;
//    self.view5.translatesAutoresizingMaskIntoConstraints=NO;
//    self.view5.backgroundColor=[UIColor redColor];
    
    self.slider = [[UISlider alloc]initWithFrame:CGRectZero];
    self.slider.translatesAutoresizingMaskIntoConstraints=NO;
    self.slider.minimumValue = 80.f;
    self.slider.maximumValue = 120.f;
    self.slider.value = 80.f;
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.slider];
    
    //把所有需要添加约束的空间放入字典中
    NSDictionary * dict = @{@"view1":self.view1,
                            @"view2":self.view2,
//                            @"view3":self.view3,
//                            @"view4":self.view4,
//                            @"view5":self.view5,
                            @"slider":self.slider};
    
    //添加约束
#pragma mark V：Y 轴的值    H：X  轴的值
#pragma mark view1
    NSArray * view1TopC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[view1]" options:0 metrics:nil views:dict];//V:Y轴的值
    
    NSArray * view1Width = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view1(80)]" options:0 metrics:nil views:dict];//Y轴的值
    
    self.view1WidthC = view1Width[0];
    NSArray * view1Height = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view1(80)]" options:0 metrics:nil views:dict];//
    self.view1HeigthC = view1Height[0];
    
    [self.view addConstraints:view1TopC];
    [self.view addConstraint:self.view1HeigthC];
    [self.view addConstraint:self.view1WidthC];
    
    
#pragma mark view2
    NSArray * view2TopC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view1]-20-[view2]" options:0 metrics:nil views:dict];//Y轴的值
    
    NSArray * view2LeftC = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[view2]" options:0 metrics:nil views:dict];
    
    NSArray * view2RightC = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view2]-50-|" options:0 metrics:nil views:dict];
    
    NSArray * view2HeightC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view2(35)]" options:0 metrics:nil views:dict];
    
    NSLayoutConstraint * view1View2centerX = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view2 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    [self.view addConstraints:view2TopC];
    [self.view addConstraints:view2LeftC];
    [self.view addConstraints:view2RightC];
    [self.view addConstraints:view2HeightC];
    [self.view addConstraint:view1View2centerX];
    
    
#pragma mark view3
    NSArray * view3TopC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view2]-20-[view3]" options:0 metrics:nil views:dict];
    NSArray * view3LeftC = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[view3]" options:0 metrics:nil views:dict];
    NSArray * view3RightC = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view3]-50-|" options:0 metrics:nil views:dict];
    NSArray * view3HeightC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view3(35)]" options:0 metrics:nil views:dict];
    
    NSLayoutConstraint * view2View3centerX = [NSLayoutConstraint constraintWithItem:self.view2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    [self.view addConstraints:view3TopC];
    [self.view addConstraints:view3LeftC];
    [self.view addConstraints:view3RightC];
    [self.view addConstraints:view3HeightC];
    [self.view addConstraint:view2View3centerX];
 
#pragma mark view4
    
//    NSArray * view4TopC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view4]-40-|" options:0 metrics:nil views:dict];//V:Y轴的值
//
//    NSArray * view4LeftC = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[view4]" options:0 metrics:nil views:dict];//H:X轴的值
//    
//    NSArray * view4HeightC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view4(35)]" options:0 metrics:nil views:dict];
//    
//    NSArray * view4WidthC = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view4(80)]" options:0 metrics:nil views:dict];
//
//    [self.view addConstraints:view4TopC];
//    [self.view addConstraints:view4LeftC];
//    [self.view addConstraints:view4HeightC];
//    [self.view addConstraints:view4WidthC];
    
//    NSArray * view1Width = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view1(80)]" options:0 metrics:nil views:dict];//Y轴的值
//    
//    self.view1WidthC = view1Width[0];
//    NSArray * view1Height = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view1(80)]" options:0 metrics:nil views:dict];//X 轴的值
//    self.view1HeigthC = view1Height[0];
    
#pragma mark slider
    NSArray * sliderTopC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view2]-20-[slider]" options:0 metrics:nil views:dict];
    NSArray * sliderHeightC = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[slider(30)]" options:0 metrics:nil views:dict];
    NSArray * sliderRight = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[slider]" options:0 metrics:nil views:dict];
    NSArray * sliderLeft = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[slider]-20-|" options:0 metrics:nil views:dict];
    
    [self.view addConstraints:sliderTopC];
    [self.view addConstraints:sliderHeightC];
    [self.view addConstraints:sliderLeft];
    [self.view addConstraints:sliderRight];
}
-(void)ChangeValue:(UISlider *)sender
{
    
}
@end
