//
//  ViewController.m
//  Slider、Stepper-home
//
//  Created by 闫潇 on 14/12/22.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel  * sliderLabel;
@property (nonatomic,strong) UILabel  * stepperLabel;
@property (nonatomic,strong) UIImageView * myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建0.5标签  并贴上去
    self.sliderLabel = [[UILabel alloc]initWithFrame:CGRectMake(28, 34, 42, 21)];
    self.sliderLabel.text = @"0.5";
    [self.view addSubview:self.sliderLabel];
    //创建stepper label
    self.stepperLabel = [[UILabel alloc]initWithFrame:CGRectMake(206, 285, 79, 21)];
    self.stepperLabel.text = @"iphone 4";
    [self.view addSubview:self.stepperLabel];
    
    //创建slider
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake(76, 28, 226, 34)];
    slider.minimumValue=0.0f;
    slider.maximumValue=1.0f;
    slider.value=0.5f;
    slider.userInteractionEnabled=YES;
    [slider addTarget:self action:@selector(sliderChangeValued:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    //创建stepper
    UIStepper * stepper = [[UIStepper alloc]initWithFrame:CGRectMake(206, 218, 0, 0)];
    stepper.minimumValue = 4;
    stepper.maximumValue = 7;
    stepper.stepValue=1;
    [stepper addTarget:self action:@selector(stepperChangeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
    
    
    //创建imageView
    self.myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 215, 92, 162)];
    self.myImageView.image = [UIImage imageNamed:@"iPhone"];
    [self.view addSubview:self.myImageView];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 滑块滑动
-(void)sliderChangeValued:(UISlider *)sender
{
    self.sliderLabel.text= [NSString stringWithFormat:@"%.2f",sender.value];
}
#pragma mark stepper值发生改变
-(void)stepperChangeValue:(UIStepper *)sender
{
    int value = sender.value;
    self.stepperLabel.text = [NSString stringWithFormat:@"%.2f",sender.value];
    switch (value)
    {
        case 4:
            self.myImageView.frame= CGRectMake(48, 215, 92, 162);
            break;
        case 5:
            self.myImageView.frame= CGRectMake(48, 215-60, 92, 162+60);
            break;
        case 6:
            self.myImageView.frame= CGRectMake(48, 215-60*2, 92, 162+60*2);
            break;
        case 7:
            self.myImageView.frame= CGRectMake(48, 215-60*3, 92, 162+60*3);
            break;
            
        default:
            break;
    }
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
