//
//  ViewController.m
//  iOS-简易计算器
//
//  Created by ibokan on 14/12/15.
//  Copyright (c) 2014年 @慕辰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(assign,nonatomic)BOOL isUSerInputNumber;//判断当前是否是输入数字状态
@property(assign,nonatomic)float num1;//输入的第一个数字
@property(assign,nonatomic)float num2;//输入的第二个数字
@property(copy,nonatomic)NSString *operateType;//操作类型（+.-.*./）
@property (strong, nonatomic) IBOutlet UILabel *displayNumber;//界面的文本标签

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 点击数字键完成的工作
- (IBAction)touchNumber:(UIButton *)sender {
    /*首先判断是不是连续按数字键（isUserInputNumber=YES）：
    •	如果是，则分别取得界面文本标签中的数字和数字按钮上的数字，然后组合起来赋值给界面文本标签。
    •	如果不是，则界面文本标签显示数字按钮上的数字，isUserInputNumber标识置成YES。*/
    if (self.isUSerInputNumber) {
        long long inputNumber = [self.displayNumber.text longLongValue] * 10 + sender.tag;
        self.displayNumber.text = [NSString stringWithFormat:@"%lld",inputNumber];
    } else {
        self.displayNumber.text = [NSString stringWithFormat:@"%ld",sender.tag];
        self.isUSerInputNumber = YES;
    }
}
#pragma mark 点击操作按钮完成的工作
- (IBAction)touchOperate:(UIButton *)sender {
    //首先保存输入的第一个数，然后保存操作类型(+、-、*、/)，最后isUserInputNumber标识置成NO。
    self.num1 = [self.displayNumber.text floatValue];
    switch (sender.tag) {
        case 101:
            self.operateType = @"+";
            break;
        case 102:
            self.operateType = @"-";
            break;
        case 103:
            self.operateType = @"*";
            break;
        case 104:
            self.operateType = @"/";
            break;

        default:
            break;
    }
    self.isUSerInputNumber = NO;
}
#pragma mark 点击等号完成的工作
- (IBAction)touchEquel:(UIButton *)sender {
    /*•	声明保存结果的变量result。
     •	如果按等号前按了数字键（isUserInputNumber=YES），保存输入的第二个数；然后条件分支判断操作类型(+、-、*、/)，条件分支中处理相同，如下：根据操作类型(+、-、*、/)进行计算，保存结果。最后isUserInputNumber标识置成NO。*/
    float result = 0;
    if (self.isUSerInputNumber) {
        self.num2 = [self.displayNumber.text floatValue];
        if ([self.operateType isEqualToString:@"+"]) {
            result = self.num1 + self.num2;
        }else if ([self.operateType isEqualToString:@"-"]) {
            result = self.num1 - self.num2;
        }else if ([self.operateType isEqualToString:@"*"]) {
            result = self.num1 * self.num2;
        }else if ([self.operateType isEqualToString:@"/"]) {
            result = self.num1 / self.num2;
        }
        self.displayNumber.text = [NSString stringWithFormat:@"%.2f",result];
    }
    self.isUSerInputNumber = NO;
}
#pragma mark 点击清除键完成的工作
- (IBAction)touchClear:(UIButton *)sender {
    /*•	界面中文本标签中的数字置成0。
     •	isUserInputNumber标识置成NO。*/
    self.displayNumber.text = @"0";
    self.isUSerInputNumber = NO;
}
#pragma mark 点击退格键完成的工作
- (IBAction)touchBack:(id)sender {
    NSString * displayNumber = self.displayNumber.text;
    
    self.displayNumber.text = [displayNumber substringToIndex:displayNumber.length -1];
}









@end
