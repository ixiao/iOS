//
//  TableViewController.m
//  第四章-删除-移动数据
//
//  Created by 闫潇 on 14/12/30.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (nonatomic,strong) NSMutableArray * list;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //准备数据源
    self.list = [NSMutableArray new];
    for (int i=0; i<20; i++) {
    NSString *name = [NSString stringWithFormat:@"hejin%d",i+1];
    [self.list addObject:name];
    }
    NSLog(@"list:%@",self.list);

    //创建左导航按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:self action:@selector(doEdit:)];
    //加入导航栏
    self.navigationItem.leftBarButtonItem = leftButton;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
#pragma -------
//此数据源方法指定表视图有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
//此数据源方法指定表视图每个分区有几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.list.count;
}
//此数据源方法指定表视图如何显示数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建可重用标识符
    static NSString *cellID = @"cellID";
    //首先从出列可重用队列中获取单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    //如果没有才创建单元格对象
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    // Configure the cell...
    //给单元格文本标签赋值
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}
-(void)doEdit:(UIBarButtonItem *)sender
{
    //改变按钮文字
    if ([sender.title isEqualToString:@"编辑"])
    {
        sender.title=@"完成";
    }
    else
    {
        sender.title = @"编辑";
    }
    //改变tableView的编辑状态(默认不可编辑)
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    //改变左导航按钮编辑
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
//    return 0;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

#pragma mark 此数据源方法提交编辑
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.list removeObjectAtIndex:indexPath.row];
        NSLog(@"删除数据后数据源:%@",self.list);
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
#pragma mark 此数据源方法提交移动
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    //修改数据源，完成数据源的改变
    NSUInteger fromRow = fromIndexPath.row;
    NSUInteger toRow = toIndexPath.row;
    id obj = self.list[fromRow];
    [self.list removeObjectAtIndex:fromRow];
    [self.list insertObject:obj atIndex:toRow];
    NSLog(@"移动数据后数据源:%@",self.list);
}

#pragma mark 此数据源方法决定是否出现单元格右边的移动按钮
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark 此数据源方法可以改变删除按钮文字,修改UItableView进行删除操作时，右边出现的删除按钮上的文字
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
@end
