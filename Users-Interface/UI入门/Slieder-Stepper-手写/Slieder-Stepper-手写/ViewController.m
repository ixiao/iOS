//
//  ViewController.m
//  Slieder-Stepper-手写
//
//  Created by 闫潇 on 14/12/22.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel * sliderLeftLabel;
@property (nonatomic,strong) UILabel * sliderRightLabel;
@property (nonatomic,strong) UILabel * steppterLabel;
@property (nonatomic,strong) UISlider * slider;
@property (nonatomic,strong) UIImageView * imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self myView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)myView
{
    self.sliderLeftLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 40, 40, 20)];
    self.sliderLeftLabel.text=@"0.5";
    [self.view addSubview:self.sliderLeftLabel];
    
    self.sliderRightLabel = [[UILabel alloc]initWithFrame:CGRectMake(260, 40, 40, 20)];
    self.sliderRightLabel.text=@"1.0";
    [self.view addSubview:self.sliderRightLabel];
    
    //滑块
    self.slider = [[UISlider alloc]initWithFrame:CGRectMake(80, 40, 160, 20)];
    self.slider.minimumValue = 1;
    self.slider.maximumValue = 100;
    self.slider.value=50;
    [self.slider addTarget:self action:@selector(doSlider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(46, 209, 160, 240)];
    
    self.imageView.image = [UIImage imageNamed:@"iPhone.png"];
    [self.view addSubview:self.imageView];
    
}
-(void)sliderValueChanged:(UISlider *)sender;
{
    float value = sender.value;
    
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
