//
//  ViewController.m
//  第三章 日期选择器
//
//  Created by 闫潇 on 14/12/23.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置label上显示系统当前日期显示日期时间
//    NSDate * now = self.
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 获取日期时间内容
- (IBAction)dateValueChange:(UIDatePicker *)sender {
    //获取日期选取器内容
    NSDate * date = sender.date;
    //格式化日期时间并显示到label上
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy年MM月dd日  HH:mm:ss"];
    self.dateLabel.text = [formatter stringFromDate:date];
}
#pragma mark 格式化日期时间对象，返回日期时间格式的字符串
//-(NSString *)formatterDate:(nsdate *)date
//{
//    //格式化日期时间并返回日期时间格式的字符串
//    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
//    
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
