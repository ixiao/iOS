//
//  ViewController.m
//  Calculator
//
//  Created by 闫潇 on 14/12/15.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"
#import "CaculatorManager.h"
@interface ViewController ()
@property (assign,nonatomic) BOOL isUserInputNumber;
@property (assign,nonatomic) float num1;
@property (assign,nonatomic) float num2;
@property (copy,nonatomic) NSString * operateType;
@property (strong, nonatomic) IBOutlet UILabel *sumNumber;
@property (strong,nonatomic) CaculatorManager * ccm;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ccm = [CaculatorManager new];
    [self.ccm addObserver:self forKeyPath:@"inputNumber" options:NSKeyValueObservingOptionNew context:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
//实现观察者的回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"inputNumber"])
    {
        long long newInputNumber = [change[@"new"]longLongValue];

    }
    else
    {
        self.sumNumber.text=[NSString stringWithFormat:@"%ld",sender.tag];
        self.isUserInputNumber=YES;
    }
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
#pragma mark 点击数字完成的工作
- (IBAction)touch:(UIButton *)sender {
    /*–	首先判断是不是连续按数字键（isUserInputNumber=YES）：
     •	如果是，则分别取得界面文本标签中的数字和数字按钮上的数字，然后组合起来赋值给界面文本标签。
     •	如果不是，则界面文本标签显示数字按钮上的数字，isUserInputNumber标识置成YES。
     */
    if (self.isUserInputNumber) {
        long long  InputNumber = [self.sumNumber.text intValue]* 10 + sender.tag;
        self.sumNumber.text = [NSString stringWithFormat:@"%lld",InputNumber];
    }
    else
    {
        self.sumNumber.text = [NSString stringWithFormat:@"%ld",sender.tag];
        self.isUserInputNumber = YES;
    }
}
- (IBAction)touchF:(UIButton *)sender {
    /*•	按加减乘除键完成的操作：
     –	首先保存输入的第一个数，然后保存操作类型(+、-、*、/)，最后isUserInputNumber标识置成NO。
*/
    self.num1 = [self.sumNumber.text floatValue];
    switch (sender.tag) {
        case 101:
            self.operateType=@"+";
            break;
        case 102:
            self.operateType=@"-";
            break;
        case 103:
            self.operateType=@"*";
            break;
        case 104:
            self.operateType=@"/";
            break;
        default:
            break;
    }
    self.isUserInputNumber = NO;
}
#pragma mark 点击等号完成的工作
- (IBAction)dengButton:(UIButton *)sender {
    /*
     •	按等号键完成的操作：
     •	声明保存结果的变量result。
     •	如果按等号前按了数字键（isUserInputNumber=YES），保存输入的第二个数；然后条件分支判断操作类型(+、-、*、/)，条件分支中处理相同，如下：根据操作类型(+、-、*、/)进行计算，保存结果。最后isUserInputNumber标识置成NO。
     */
    float result = 0;
    if (self.isUserInputNumber)
    {
        self.num2 = [self.sumNumber.text floatValue];
        if ([self.operateType isEqualToString:@"+"])
        {
            result = self.num1 +self.num2;
        }
        else if ([self.operateType isEqualToString:@"-"])
        {
            result = self.num1 - self.num2;
        }
        else if ([self.operateType isEqualToString:@"*"])
        {
            result = self.num1 * self.num2;
        }
        else if ([self.operateType isEqualToString:@"/"])
        {
            result = self.num1 / self.num2;
        }
        self.sumNumber.text = [NSString stringWithFormat:@"%.2f",result];
    }
    self.isUserInputNumber = NO;
}
- (IBAction)chearButton:(UIButton *)sender {
    self.sumNumber.text =@"0";
    self.isUserInputNumber=NO;
}
#pragma mark 退格
- (IBAction)backButton:(UIButton *)sender {
    NSString * sum = self.sumNumber.text;
    [self.sumNumber.text=sum substringToIndex: sum.length -1];
    if (self.sumNumber) {
        long long 
    }
}


@end
