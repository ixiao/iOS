//
//  RootViewController.m
//  EnglishIndex
//
//  Created by Fan Tengfei on 14/12/31.
//  Copyright (c) 2014年 Fan Tengfei. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property(strong,nonatomic)NSDictionary *names;  //姓名字典
@property(strong,nonatomic)NSArray *keys;  //键数组

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //读取文件
    NSString *plistPath=[[NSBundle mainBundle]pathForResource:@"sortednames" ofType:@"plist"];
    self.names=[NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    self.keys=[self.names allKeys];
    
    self.keys=[self.keys sortedArrayUsingSelector:@selector(compare:)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.keys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    //通过分区索引获取当前键
    NSString *currentKey=self.keys[section];
    //通过当前键获取当前分区数组
    NSArray *currentGroup=self.names[currentKey];
    return currentGroup.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建出列可重用标识符
    static NSString *cellID=@"cellID";
    //从出列可重用队列中获取单元格
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    // Configure the cell...
    
    //通过分区索引获取当前键
    NSString *currentKey=self.keys[indexPath.section];
    //通过当前键获取当前分区数组
    NSArray *currentGroup=self.names[currentKey];
    cell.textLabel.text=currentGroup[indexPath.row];
    
    return cell;
}
//次数据源方法指定每个分区标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.keys[section];
}

//次数据源方法添加分区索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.keys;
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
