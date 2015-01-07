//
//  ViewController.m
//  第四章-表视图-story
//
//  Created by 闫潇 on 14/12/29.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UITableView * tabView;//表视图
@property (nonatomic,strong) NSArray * listData;//数据源1
@property (nonatomic,strong) NSArray * listData2;//数据源2
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建表视图
    self.tabView= [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //表视图加入视图中
    [self.view addSubview:self.tabView];
    //指定表视图的数据源和委托
    self.tabView.dataSource=self;
    self.tabView.delegate=self;
    //准备表视图的数据源
    self.listData = @[@"张三",@"李四",@"王五",@"赵六",@"呵呵"];
    self.listData2 = @[@"唐僧",@"孙悟空",@"猪八戒",@"沙僧",@"何瑾",@"张帅",@"貂蝉"];
    
    // Do any additional setup after loading the view, typically from a nib.
}
//实现表视图回调的数据源和委托方法
#pragma mark 此数据源方法指定表视图有几个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}
#pragma mark 此数据源方法指定每个分区有几行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger count = 0;
    switch (section)
    {
        case 0:
            count = self.listData.count;
            break;
        case 1:
            count = self.listData2.count;
            break;
        default:
            break;
    }
    return self.listData.count;
}
#pragma mark 此数据源方法指定表视图单元格如何展示数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    switch (indexPath.section)
    {
        case 0:
            cell.textLabel.text = self.listData[indexPath.row];//索引路径
            break;
        case 1:
            cell.textLabel.text = self.listData2[indexPath.row];//索引路径
            break;
        default:
            break;
    }
    //创建默认风格的单元格

    //指定单元格图片
    cell.imageView.image = [UIImage imageNamed:@"png-0010"];
    //指定单元格文本内容
    NSLog(@"indexpath.section:%ld,indexPath.row:%ld",indexPath.section,indexPath.row);
    
    //指定单元格扩展按钮
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//细节指使按钮
//    cell.accessoryType = UITableViewCellAccessoryDetailButton;//信息说明按钮
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;//信息说明按钮+细节指示按钮
//    cell.accessoryType=UITableViewCellAccessoryCheckmark;//复选按钮

    
    return cell;
}
#pragma mark 数据源方法，此方法生成每个分区的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * title = nil;
    switch (section)
    {
        case 0:
            title = @"第一分队";
            break;
        case 1:
            title = @"第二分队";
            break;
        default:
            break;
    }
    return title;
}
#pragma mark 此数据方法，生成每个分区的footer
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString * footer = nil;
    switch (section)
    {
        case 0:
            footer = [NSString stringWithFormat:@"取经第%ld个人",self.listData.count];
            break;
        case 1:
            footer = [NSString stringWithFormat:@"取经第%ld个人",self.listData2.count];
            break;
        default:
            break;
    }
    return footer;
}
#pragma mark 此数据方法，展示用户点击细节说明时回调
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSString * title = nil;
    switch (indexPath.section)
    {
        case 0:
            title = self.listData[indexPath.row];
            
            break;
        case 1:
            title = self.listData2[indexPath.row];
            
            break;
        default:
            break;
    }
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"您选择了" message:title delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] ;
    [alert show];
}
#pragma mark 此委托方法在用户点击表视图单元格时回调
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        NSString * title = nil;
        switch (indexPath.section)
        {
            case 0:
                title = self.listData[indexPath.row];
                break;
            case 1:
                title = self.listData2[indexPath.row];
                break;
            default:
                break;
        }
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"您选择了" message:title delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
}
//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString * title = nil;
//    switch (indexPath.section)
//    {
//        case 0:
//            title = self.listData[indexPath.row];
//            break;
//        case 1:
//            title = self.listData2[indexPath.row];
//            break;
//        default:
//            break;
//    }
//    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"您选择了" message:title delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alert show];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
