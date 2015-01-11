//
//  ViewController.m
//  第八章-JSON-数据
//
//  Created by 闫潇 on 15/1/8.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建tableView
    self.tableView= [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    //活动指示器
    UIActivityIndicatorView * activityindicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [activityindicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activityindicator];
    [activityindicator setCenter:self.view.center];
//    UIView * view = [[UIView alloc]initWithFrame:self.view.bounds];
//    [view setBackgroundColor:[UIColor blackColor]];
//    [self.view addSubview:view];
    //绑定委托
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self JSONPare];
}
#pragma  mark 异步网络请求和JSON解析
-(void)JSONPare
{
    //获取文件路径
    NSURL * url = [NSURL URLWithString:@"http://api.jiepang.com/v1/categories/list?source=100456"];
    //通过url创建http请求（请求）
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
//    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
//    //建立NSURLConnetion发送同步请求
//    NSURLResponse * response = nil;
//    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    self.myData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
//    NSArray *arr1 = [[NSArray alloc]initWithObjects:@"0",@"5",nil];
//    
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arr1];
//    
//    NSArray *arr2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 连接成功 仅调用一次
//成功接受数据
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.list = [NSMutableArray new];
    self.myData = [NSMutableData new];
}
#pragma mark 多次调用，  多次返回数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.myData appendData:data];
}
#pragma mark 响应完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //处理响应的数据
    NSError * error = nil;
    self.list = [NSJSONSerialization JSONObjectWithData:self.myData options:NSJSONReadingMutableContainers error:&error];
    if (error)
    {
        NSLog(@"error:%@",[error localizedDescription]);
    }
    else
    {
//        NSLog(@"%@",self.list);
        //刷新单元格
        [self.tableView reloadData];
    }
}
#pragma mark tableView dataoure
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    NSMutableDictionary * dict = self.list[indexPath.row];
//    cell.textLabel.text = dict[@"name"];
    cell.textLabel.text = self.list[indexPath.row][@"name"];
    return cell;
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
//    NSMutableDictionary *dict = self.list[indexPath.row];
//    
//    cell.textLabel.text = [dict objectForKey:@"name"];
//    
//    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.son)
    {
        self.son = [sonViewController new];
    }
    else
    {
        //将下一个视图控制器压入栈中
        self.son.array = self.list[indexPath.row][@"children"];
        [self.navigationController pushViewController:self.son animated:YES];
    }
}
@end
