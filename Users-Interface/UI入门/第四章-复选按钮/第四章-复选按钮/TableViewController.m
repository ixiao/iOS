//
//  TableViewController.m
//  第四章-复选按钮
//
//  Created by 闫潇 on 14/12/30.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "TableViewController.h"
#import "City.h"
@interface TableViewController ()
@property (nonatomic,strong) NSArray * cities;//城市数据源
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 准备数据源
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"city" ofType:@"plist"];
    self.cities = [NSArray arrayWithContentsOfFile:filePath];
    // 整理加工数据源
    NSMutableArray *tmp = [NSMutableArray new];
    for (NSString *cityName in self.cities) {
        // 创建城市对象
        City *city = [City new];
        city.cityName = cityName;
        // 把城市对象放入临时数组
        [tmp addObject:city];
    }
    // 城市数据源中存放城市对象
    self.cities = tmp;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//此数据源指定表视图有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
//此数据源方法指定表视图每个分区有几个数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.cities.count;
}
// 此数据源方法指定单元格如何展示数据（生成单元格）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 出列可重用标识符
    static NSString *cellID = @"cellID";
    // 从出列可重用队列中获取单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    // 如果没有则创建
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    // Configure the cell...
    // 获取城市数据源中的城市对象
    City *city = self.cities[indexPath.row];
    // 把城市对象的名称显示在单元格里
    cell.textLabel.text = city.cityName;
    // 根据城市对象是否被选中决定单元格是否被选中
    if (city.isSelected) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - Table view delegate
// 此委托方法在单元格某一行被选中时回调
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 首先判断之前是否有单元格被选中，如果有，设置之前选中的单元格为未选中
   
    // 设置当前选中的单元格 选中状态
    City *city = self.cities[indexPath.row];
    
    // 设置该城市对象选中状态
    city.isSelected=!city.isSelected;

    // 刷新当前单元格
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
