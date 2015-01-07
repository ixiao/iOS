//
//  RootViewController.m
//  第七章-代码块
//
//  Created by 闫潇 on 15/1/4.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "RootViewController.h"
#import "DeatilViewController.h"
@interface RootViewController ()
@property (nonatomic,strong) NSMutableArray * list;//数据源
@property (nonatomic,strong) DeatilViewController * deatiVC;//模态视图
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"点击进行编辑";
    self.list = [NSMutableArray new];
    for (int i = 0; i<20; i++)
    {
        NSString * name = [NSString stringWithFormat:@"shaolin%d",i+1];
        [self.list addObject:name];
    }
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
//数据源方法指定表视图有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}
//数据源方法指定表视图每个分区有几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.list.count;
}

//该数据源方法指定表视图如何展示数据

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建可重用标志符
    NSString * cellID=@"cellID";
    //首先从可重用队列中获取单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    //如果没有就创建单元格对象
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //给单元格文本标签赋值
    cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
    // Configure the cell...
    //创建细节展示按钮
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
#pragma mark 此委托方法在点击表视图的某一行时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    //创建模态视图 把代码块对象 传进去
    self.deatiVC = [[DeatilViewController alloc]initWithBlock:^(NSString *name)
    {
        //1.修改数据源
        [self.list replaceObjectAtIndex:indexPath.row withObject:name];
        //2.更新表视图
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }];
    //属性传值
    self.deatiVC.name=self.list[indexPath.row];
    //弹出模态视图
    [self presentViewController:self.deatiVC animated:YES completion:nil];
}

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

@end
