//
//  TapViewController.m
//  GestureRecognizer手势识别器
//
//  Created by ibokan on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@property (strong, nonatomic) IBOutlet UILabel *singleTapLabel;
@property (strong, nonatomic) IBOutlet UILabel *doubleTapLable;

@property (strong, nonatomic) IBOutlet UILabel *tripleTapLabel;

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 创建手势识别器
    [self createGestureRecognizer];
}

#pragma mark 创建手势识别器
- (void)createGestureRecognizer {
    // 创建单击手势识别器
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1:)];
    // 创建双击手势识别器
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
    // 创建三击手势识别器
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap3:)];
    // 设置各个手势识别器相关属性
    // 单击
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    // 双击
    tap2.numberOfTapsRequired = 2;
    tap2.numberOfTouchesRequired = 1;
    // 三击
    tap3.numberOfTapsRequired = 3;
    tap3.numberOfTouchesRequired = 1;
    // 消除手势重叠
    // 单击等待双击失效后才能触发
    [tap1 requireGestureRecognizerToFail:tap2];
    // 双击等待三击失效后才能触发
    [tap2 requireGestureRecognizerToFail:tap3];
    // 注册手势识别器
    [self.view addGestureRecognizer:tap1];
    [self.view addGestureRecognizer:tap2];
    [self.view addGestureRecognizer:tap3];
}
#pragma mark 手势识别方法
- (void)tap1:(UITapGestureRecognizer *)recognizer {
    self.singleTapLabel.text = @"检测到单击!";
    // 1秒以后Label文字消失
    [self performSelector:@selector(eraseLabel:) withObject:self.singleTapLabel afterDelay:1.0];
}
- (void)tap2:(UITapGestureRecognizer *)recognizer {
    self.doubleTapLable.text = @"检测到双击!";
    // 1秒以后Label文字消失
    [self performSelector:@selector(eraseLabel:) withObject:self.doubleTapLable afterDelay:1.0];
}
- (void)tap3:(UITapGestureRecognizer *)recognizer {
    self.tripleTapLabel.text = @"检测到三击!";
    // 1秒以后Label文字消失
    [self performSelector:@selector(eraseLabel:) withObject:self.tripleTapLabel afterDelay:1.0];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 让Label文字消失方法
- (void)eraseLabel:(UILabel *)label {
    label.text = @"";
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
