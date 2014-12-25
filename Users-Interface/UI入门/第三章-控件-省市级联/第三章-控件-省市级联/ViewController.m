//
//  ViewController.m
//  第三章-控件-省市级联
//
//  Created by 闫潇 on 14/12/23.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *pickView;
@property (nonatomic,strong) NSArray * provinces;//省份数组
@property (nonatomic,strong) NSArray * cities;//城市数组
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //指定数据源选取器和委托
    self.pickView.dataSource=self;
    self.pickView.delegate=self;
    //获取初始的省份和城市数组
    NSString * path = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"];
    self.provinces= [NSArray arrayWithContentsOfFile:path];
    self.cities = self.provinces[0][@"Cities"];
    
}
#pragma mark pickView回调的委托方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{//几个表盘
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{//每个表盘有几行数据
    NSUInteger  count = 0;
    switch (component)
    {
        case 0://省份表盘
            count =self.provinces.count;
            break;
        case 1://城市表盘
            count =self.cities.count;
            break;
        default:
            break;
    }
    return count;
}
//指定每个表盘如何展示数据
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    NSString * title = nil;
    switch (component)
    {
        case 0:
            title = self.provinces[row][@"State"];
            break;
        case 1:
            title = self.cities[row][@"city"];
            break;
        default:
            break;
    }
    return title;
}
#pragma 选中某一表盘某一行回调的委托方法
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0)//选中省份表盘某一行时改变省份对应的城市数组
    {
        self.cities = self.provinces[row][@"Cities"];
        //更新城市表盘
        [pickerView reloadComponent:1];
    }
    //获取省份名称,组合起来
    NSString * str =  [self getProvincesAndCityName:pickerView];
    NSLog(@"%@",str);
}
#pragma 获取省份名称和城市名称  组合起来
-(NSString *)getProvincesAndCityName:(UIPickerView *)sender
{
    NSString * provincesAndCityName = nil;
    NSString * provinName = self.provinces[[sender selectedRowInComponent:0]][@"State"];
    NSString * cityName=self.cities[[sender selectedRowInComponent:1]][@"city"];
    provincesAndCityName = [NSString stringWithFormat:@"%@%@",provinName,cityName];
    return provincesAndCityName;
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
