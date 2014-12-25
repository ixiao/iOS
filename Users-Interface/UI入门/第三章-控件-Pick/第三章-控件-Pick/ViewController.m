//
//  ViewController.m
//  第三章-控件-Pick
//
//  Created by 闫潇 on 14/12/23.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *pickView;
@property (nonatomic,strong) NSArray * list;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建警告窗口
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"警告：" message:@"这是一个警告窗口！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",@"没用",nil];
    //弹出警告窗口
    [alertView show];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    //指定pickView的数据源和委托
    self.pickView.dataSource=self;
    self.pickView.delegate=self;
    //准备数据源
//    self.list = @[@"张三",@"李四",@"王五",@"赵六",@"tom"];
    //读取plist文件
    NSString * path = [[NSBundle mainBundle]pathForResource:@"city" ofType:@"plist"];
    //把plist读取到数组活字典中
    self.list = [NSArray arrayWithContentsOfFile:path];
}
#pragma mark pickView回调的委托方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{//几个表盘
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{//每个表盘有几行数据
    return self.list.count;
}
//指定每个表盘如何展示数据
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSLog(@"rou:%ld",row);
    return self.list[row];
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
