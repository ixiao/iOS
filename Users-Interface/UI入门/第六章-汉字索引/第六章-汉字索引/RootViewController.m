//
//  RootViewController.m
//  第六章-汉字索引
//
//  Created by 闫潇 on 14/12/31.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "RootViewController.h"
#import "ChineseIndex.h"
@interface RootViewController ()
@property (nonatomic,strong) NSDictionary * citieNames;//城市字典
@property (nonatomic,strong) NSArray * keys; //键数组

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取数据源
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"city" ofType:@"plist"];
    //读取到城市数组中
    self.citieNames = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    
    //将城市数组分组排
    self.citieNames = [ChineseIndex groupedChineseCharacter:cities];
    
    self.keys = [self.citieNames allKeys];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//几行分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.keys.count;
}

//几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    //通过分区索引获取当前键
    // Return the number of rows in the section.
    NSString * currentKey = self.keys[section];
    //通当前建 获取当前分区数组
    NSArray * currentGroup = self.names[currentKey];
    
    return currentGroup.count;
}

//如何展示数据(生成单元格)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建出列可重用标志符
    static NSString * cellID=@"cellID";
    //从出列可重用队列中获取单元格
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    //如果没有 则创建单元格
    if (!self) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        // 设置单元格的title属性
        // 通过分区索引获取当前键
        NSString *currentKey = self.keys[indexPath.section];
        // 通过当前键获取当前分区数组
        NSArray *currentGroup = self.names[currentKey];
        cell.textLabel.text = currentGroup[indexPath.row];
        return cell;
    }
    return cell;
    
}
#pragma mark 添加分区索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.keys;
}
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

@end
