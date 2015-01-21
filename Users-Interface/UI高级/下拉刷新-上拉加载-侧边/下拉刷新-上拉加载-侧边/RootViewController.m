//
//  RootViewController.m
//  下拉刷新-上拉加载-侧边
//
//  Created by 闫潇 on 15/1/20.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "RootViewController.h"
#import "MJRefresh.h"
@interface RootViewController ()
@property (strong, nonatomic) NSMutableArray *listData;//数据源
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //准备数据源
    self.listData = [NSMutableArray new];
    for (int i=1; i<21; i++) {
        NSString *str = [NSString stringWithFormat:@"单元格%d",i];
        [self.listData addObject:str];
    }
 
    [self refreshDown];
    [self refreshUp];
    
}

#pragma mark 下拉刷新
-(void)refreshDown
{
    //下啦刷新
    __weak __block RootViewController * copy_self = self;
    [self.tableView addHeaderWithCallback:^{
        //发送网络请求 完成下拉刷新 最新数据的功能
        
        //清空数据源
        [copy_self.listData removeAllObjects];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            static int j = 20;
            for (int i = 0; i<20 ; i++)
            {
                //在block内使用self一定要进行如下复制
                NSString * str = [NSString stringWithFormat:@"%dnew单元格",j];
                [copy_self.listData addObject:str];
                j++;
            }
            //主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [copy_self.tableView reloadData];
            });
        });
        [copy_self.tableView headerEndRefreshing];
    }];
}
-(void)refreshUp
{
    //上拉加载
    __weak __block RootViewController * copy_self = self;
    
    [self.tableView addFooterWithCallback:^{
        //发送网络请求 完成下拉刷新获取数据的功能
        
        //清空数据源
        [copy_self.listData removeAllObjects];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            static int j = 20;
            for (int i = 0; i<21; i++)
            {
                //在block内使用self一定要进行如下复制
                NSString * str = [NSString stringWithFormat:@"%d只小绵羊咩咩咩",j];
                [copy_self.listData addObject:str];
                j++;
            }
            //主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [copy_self.tableView reloadData];
            });
        });
        [copy_self.tableView footerEndRefreshing];
    }];
}

#pragma mark 上拉加载
-(void)viewWillAppear:(BOOL)animated
{
    //视图一出现就自动刷新
    [self.tableView headerBeginRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.listData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text=self.listData[indexPath.row];
    
    // Configure the cell...
    
    return cell;
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
