//
//  ViewController.m
//  控件-Slerder
//
//  Created by 闫潇 on 14/12/22.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imagView;
@property (strong, nonatomic) IBOutlet UILabel *stepperLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 滑块滑动绑定的方法
- (IBAction)sliderValueChanged:(UISlider *)sender {
    //获取滑块的值
    float value = sender.value;
//    改变sliderLabel的text属性值
    self.sliderLabel.text=[NSString stringWithFormat:@"%.2f",value];
    
}
#pragma mark stepper绑定的方法
- (IBAction)stepperValueChanged:(UIStepper *)sender {
    int value = (int)sender.value;
    self.stepperLabel.text=[NSString stringWithFormat:@"iphone %d",value];
    //根据stepper 的值改变iPhoneImageView的frame
    switch (value)
    {
        case 4:
            self.imagView.frame=CGRectMake(46, 209, 160, 240);
            break;
        case 5:
            self.imagView.frame=CGRectMake(46, 209-60, 160, 240+60);
            break;
        case 6:
            self.imagView.frame=CGRectMake(46, 209-60*2, 160, 240+60*2);
            break;
        case 7:
            self.imagView.frame=CGRectMake(46, 209-60*3, 160, 240+60*3);
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
