//
//  TableViewController.m
//  第四章-单选按钮
//
//  Created by 闫潇 on 14/12/30.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "TableViewController.h"
#import "City.h"
@interface TableViewController ()
@property (nonatomic,strong) NSArray * cities;//城市数据源
@property (nonatomic,strong) NSIndexPath * lastSeletionIndexPth;//保存最后被选中单元格的索引路径

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
//    //准备数据源
//    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"city" ofType:@"plist"];
//    self.cities = [NSArray arrayWithContentsOfFile:filePath];
//    
//    //整理加工数据源
//    NSMutableArray * tmp = [NSMutableArray new];
//    for (NSString *cityName in self.cities)
//    {//创建城市对象
//        City * city = [City new];
//        city.cityName=cityName;
//        //把城市对象放入临时数组
//        [tmp addObject:city];
//    }
//    //城市数据源中存放城市对象
//    self.cities=tmp;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
////此数据源方法指定单元格如何展示数据
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    //出列可重用标识符
//    static NSString * cellID = @"cellID";
//    //从出列可重用队列中获取单元格
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    //如果没有则创建
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
//    //配置单元格   给单元格赋值
//    //获取城市数据源中的城市对象
//    City * city = self.cities[indexPath.row];
//
//    //把城市对象的名称洗说你是在单元格里
//    cell.textLabel.text = city.cityName;
//
//
//    if (city.isSelected)
//    {
//        cell.accessoryType=UITableViewCellAccessoryCheckmark;
//    }
//    else
//    {
//        cell.accessoryType=UITableViewCellAccessoryNone;
//    }
//    return cell;
//}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
//#pragma mark delegate
//
////此委托方法在单元格某一行被选中时
//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //首先判断之前是否有单元格被选中,如果有设置之前选中的单元格为未选中
//    if (self.lastSeletionIndexPth) {
//        //获取之前选中单元格对应的数据源中城市对象
//        City * city = self.cities[self.lastSeletionIndexPth.row];
//        //设置该城市对象未选中
//        city.isSelected=NO;
//        //刷新当前单元格
//        [tableView reloadRowsAtIndexPaths:@[self.lastSeletionIndexPth] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }
//    //设置当前选中的单元格未选中,获取当前选中单元格对应的数据源中城市对象
//    City * city = self.cities[indexPath.row];
//    city.isSelected=YES;
//    //刷新当前单元格
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//
//    //设置最后被选中单元格的索引路径为当前选中的单元格索引路径
//    self.lastSeletionIndexPth = indexPath;
//}
#pragma mark - Table view delegate
// 此委托方法在单元格某一行被选中时回调
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 首先判断之前是否有单元格被选中，如果有，设置之前选中的单元格为未选中
    if (self.lastSeletionIndexPth) {
        // 获取之前选中单元格对应的数据源中城市对象
        City *city = self.cities[self.lastSeletionIndexPth.row];
        // 设置该城市对象未选中
        city.isSelected = NO;
        // 刷新当前单元格
        [tableView reloadRowsAtIndexPaths:@[self.lastSeletionIndexPth] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    // 设置当前选中的单元格为选中,获取当前选中单元格对应的数据源中城市对象
    City *city = self.cities[indexPath.row];
    // 设置该城市对象选中
    city.isSelected = YES;
    // 刷新当前单元格
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    // 设置最后被选中单元格的索引路径为当前选中的单元格索引路径
    self.lastSeletionIndexPth = indexPath;
}
@end