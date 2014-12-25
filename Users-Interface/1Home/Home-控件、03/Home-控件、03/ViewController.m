//
//  ViewController.m
//  Home-控件、03
//
//  Created by 闫潇 on 14/12/23.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma 分别创建两个label
    self.birthdayLabel = [[UILabel alloc]initWithFrame:CGRectMake(46, 60, 107, 21)];
    self.birthdayLabel.text=@"1980-01-01";
    [self.view addSubview:self.birthdayLabel];
    
    self.citiesLabel = [[UILabel alloc]initWithFrame:CGRectMake(46, 110, 107, 21)];
    self.citiesLabel.text=@"北京市";
    [self.view addSubview:self.citiesLabel];
    
#pragma 四个按钮
    self.birthdayBt = [UIButton buttonWithType:UIButtonTypeSystem];
    self.birthdayBt.frame=CGRectMake(200, 106, 60, 30);
    [self.birthdayBt setTitle:@"生日选择" forState:UIControlStateNormal];
    [self.birthdayBt addTarget:self action:@selector(showBirthday:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.birthdayBt];
    
    
    
    self.citiesBt = [UIButton buttonWithType:UIButtonTypeSystem];
    self.citiesBt.frame=CGRectMake(200, 160, 60, 30);
    [self.citiesBt setTitle:@"城市选择" forState:UIControlStateNormal];
    [self.citiesBt addTarget:self action:@selector(showCities:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.citiesBt];
    
    
    self.moreBt = [UIButton buttonWithType:UIButtonTypeSystem];
    self.moreBt.frame = CGRectMake(70, 174, 60, 30);
    [self.moreBt setTitle:@"更多" forState:UIControlStateNormal];
    [self.moreBt addTarget:self action:@selector(showMore:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.moreBt];
    
    
    self.okBt = [UIButton buttonWithType:UIButtonTypeSystem];
    self.okBt.frame= CGRectMake(200, 180, 60, 30);
    [self.okBt setTitle:@"完成" forState:UIControlStateNormal];
    [self.okBt addTarget:self action:@selector(showOk:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.okBt];
    
#pragma 创建Datepicker
    self.datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 300, 320, 160)];
    NSLocale * locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    self.datepicker.locale=locale;
    NSDate * now = [NSDate date];
    self.datepicker.maximumDate=now;
    [self.datepicker addTarget:self action:@selector(datepickerChangeVlue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.datepicker];
    
    
#pragma 创建PickerView
    self.pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 300, 320, 160)];
    self.pickView.dataSource=self;//pickerView从当前ViewController获取数据
    self.pickView.delegate=self;//pickerView从当前ViewController展示数据
    [self.pickView setShowsSelectionIndicator:YES];
    [self.view addSubview:self.pickView];
    self.pickView.hidden=YES;
    
#pragma 给pickerView准备数据源
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"];
    
    //从plist文件获取省份数组
    self.provinces=[NSArray arrayWithContentsOfFile:filePath];
    //从plist文件中获取省份对应的城市数组
//    NSDictionary * dic = [self.provinces objectAtIndex:0];
    self.cities = self.provinces[0][@"Cities"];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma 点击生日按钮，切换到生日选择的datepicker
-(void)showBirthday:(UIButton *)sender
{
    self.datepicker.hidden = NO;
    self.pickView.hidden   = YES;
}
#pragma 点击城市按钮，切换到城市选择的pickView
-(void)showCities:(UIButton *)sender
{
    self.datepicker.hidden = YES;
    self.pickView.hidden   = NO;
}
//日期时间表盘改变取值
-(void)datepickerChangeVlue:(UIDatePicker *)sender
{
    NSDate * date = sender.date;
    NSDateFormatter * formatter = [NSDateFormatter new];//日期格式
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.birthdayLabel.text= [formatter stringFromDate:date];
}
//此方法指定pickerView 有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

//此方法指定表盘有几个数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSUInteger count = 0 ;
    switch (component)
    {
        case 0:
            count= self.provinces.count;//省份数组
            break;
        case 1:
            count= self.cities.count;//城市数组
            break;
        default:
            break;
    }
    return count;
}
//此委托方法指定pickerView如何展示数据
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString * title= nil;
    switch (component)
    {
        case 0:
            title=self.provinces[row][@"State"];
            break;
            case 1:
            title=self.cities[row][@"city"];
            break;
        default:
            break;
    }
    return title;
}

//此委托方法能够获取pickerView点击了哪一行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0)
    {
        self.cities=self.provinces[row][@"Cities"];
        [pickerView reloadComponent:1];
    }
    NSString * ProvincesName = self.provinces[[pickerView selectedRowInComponent:0]][@"State"];
    NSString * CitiesName = self.cities[[pickerView selectedRowInComponent:1]][@"city"];
    NSString * name = [NSString stringWithFormat:@"%@ %@",ProvincesName,CitiesName];
    self.citiesLabel.text=name;
//    NSDictionary * dic = nil;//存储省份字典
//    switch (component)
//    {
//        case 0:
//        {
//            //获取省份对应城市
//            dic = [self.provinces objectAtIndex:row];
//            NSString * provincesName = [dic objectForKey:@"State"];
//            NSLog(@"provincesName:%@",provincesName);
//            self.cities =[dic objectForKey:@"Cities"];
//            //刷新城市表盘
//            [self.pickView reloadComponent:1];
//            
//    
//        }
//           break;
//        case 1:
//        {
//            NSString * cityName= [[self.cities objectAtIndex:row]objectForKey:@"city"];
//            NSLog(@"cityName:%@",cityName);
//            
//        }
//            break;
//        default:
//            break;
//    }
    
}

-(void)showMore:(UIButton *)sender
{
    self.actionSheet = [[UIActionSheet alloc]initWithTitle:@"请选择您的操作" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:@"复制",@"粘贴", nil];
    [self.actionSheet showInView:self.view];
}
-(void)showOk:(UIButton *)sender
{
    UIAlertView * alerView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"这是一条警告信息！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alerView show];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
