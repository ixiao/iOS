//
//  RootViewController.m
//  EGO-Refresh-LoadMore
//
//  Created by 闫潇 on 15/1/21.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic,strong) PullTableView * pullTableView;//可以完成下拉刷新和上拉加载更多的表视图

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [PullTableView new];
    self.pullTableView = (PullTableView *)self.tableView;//强转
    
    //设置下拉刷新、上拉加载更多视图图标
    self.pullTableView.pullArrowImage = [UIImage imageNamed:@"blackArrow"];
    self.pullTableView.pullBackgroundColor = [UIColor yellowColor];
    self.pullTableView.pullTextColor = [UIColor blackColor];
 
    //指定可完成下啦刷新和上拉加载更多的委托
    self.pullTableView.pullDelegate=self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(!self.pullTableView.pullTableIsRefreshing) {
        self.pullTableView.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:3.0f];
    }
}
#pragma mark
-(void)refreshTable
{
    //发送网络请求请求下啦刷新最新内容
    
    self.pullTableView.pullLastRefreshDate = [NSDate date];
    self.pullTableView.pullTableIsRefreshing = NO;
    //设置最新的刷新时间
    
    //停止下拉刷新
}

- (void) loadMoreDataToTable
{
    /*
     
     Code to actually load more data goes here.
     
     */
    //停止下拉刷新
    self.pullTableView.pullTableIsLoadingMore = NO;
}
#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row 1", indexPath.row];
    
    return cell;
}

#pragma mark - PullTableViewDelegate
//下啦刷新回调的委托方法
- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView
{
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:3.0f];
}

- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView
{
    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:3.0f];
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
