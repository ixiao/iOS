//
//  ViewController.m
//  第四章-表视图-省份
//
//  Created by 闫潇 on 14/12/29.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSArray * provinces;
@property (nonatomic,strong) NSArray * cities;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建表视图
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //加入表视图
    [self.view addSubview:self.tableView];
    
    //指定表视图的数据源和委托
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
    //准备数据源
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"];
    self.provinces = [NSArray arrayWithContentsOfFile:filePath];
    
    // Do any additional setup after loading the view, typically from a nib.
}
// 实现表视图回调的数据源委托方法
#pragma  mark 此方法指定表视图有几个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.provinces.count;
}
#pragma mark 此数据源方法 指定每个分区有几行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //首先获取省份字典
    NSDictionary * provincesDic = self.provinces[section];
    //获取省份字典对应的城市数组
    self.cities = provincesDic[@"Cities"];
    return self.cities.count;
}
#pragma mark 指定表视图单元格如何展示数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //出列可重用标志符
    static NSString * cellID = @"cellID";
    //从出列可重用队列中获取单元格,如果有则使用，没有则创建
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cellID)
    {
        NSLog(@"indexPth.section:%ld,indexPath.row:%ld",indexPath.section,indexPath.row);
//        创建默认风格单元格
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    //指定单元格图片
    cell.imageView.image = [UIImage imageNamed:@"png-0010"];
    //获取省份字典
    NSDictionary * provincesDic = self.provinces[indexPath.section];
    //获取省份对应城市数组
    self.cities = provincesDic[@"Cities"];
    cell.textLabel.text = self.cities[indexPath.row][@"city"];
    //指定单元格扩展按钮
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark 此数据源方法指定每个分区的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.provinces[section][@"State"];
}
#pragma mark 此数据源方法指定每个分区的页脚
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //获取省份字典
    NSDictionary * provinceDic = self.provinces[section];
    //获取省份字典对应的城市数组
    self.cities = provinceDic[@"Cities"];
    NSString * footer = [NSString stringWithFormat:@"%@有%ld个市区",provinceDic[@"State"],self.cities.count];
    return footer;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
