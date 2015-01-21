//
//  ViewController.m
//  8-作业
//
//  Created by ibokan on 15/1/8.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *list;
@property (strong, nonatomic) NSMutableData *data;
@property (strong, nonatomic) NewViewController *firstVC;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 创建表视图
    self.tableView = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    // 指定表视图的数据源和委托
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIView *view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [view setBackgroundColor:[UIColor blackColor]];
    view.alpha = 0.3;
    view.tag = 1001;
    [self.view addSubview:view];
    
    // 创建活动指示器
    self.activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView setCenter:view.center];
    
    // 准备数据源
    [self parseJSON];
}
#pragma mark 解析JSON文件准备数据源
- (void)parseJSON {
    [self.activityIndicatorView startAnimating];
    // 创建URL
    NSURL *url = [NSURL URLWithString:@"http://api.jiepang.com/v1/categories/list?source=100456"];
    // 通过URL创建request
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0f];
    // 通过NSURLConnection进行异步连接
    [NSURLConnection connectionWithRequest:request delegate:self];
}
// 获得服务器响应后回调该方法，只调用一次，可以获取响应对象
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // 获取数组的容量
    self.list = [NSMutableArray arrayWithCapacity:10];
    // 创建存放下载的数据对象
    self.data = [[NSMutableData alloc]init];
}
// 该方法在接收到数据后调用，会调用多次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // 每次返回数据
    [self.data appendData:data];
}
// 整个连接请求完成，数据加载完成后调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // 处理接收到得数据
    NSError *error = nil;
    self.list = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"error:%@",[error localizedDescription]);
    } else {
        UIView *view = (UIView *)[self.view viewWithTag:1001];
        view.hidden = YES;
        [self.activityIndicatorView stopAnimating];
        self.activityIndicatorView.hidden = YES;
        [self.tableView reloadData];
    }
}
//来自其父协议，连接发生错误时要调用的方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[error localizedDescription] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView datasource 数据源方法
// 此数据源方法指定表视图有几个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
// 此数据源方法指定表视图每个分区有几行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}
// 此数据源方法指定表视图如何显示数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建出列可重用标识符
    static NSString *cellID = @"cellID";
    // 首先从出列可重用队列中获取单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    // 如果没有才创建单元格对象
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    // 给单元格文本标签赋值
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.list[indexPath.row][@"name"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.firstVC) {
        self.firstVC = [NewViewController new];
    }
    // 将下一个视图控制器压人栈中
    self.firstVC.list = self.list[indexPath.row][@"children"];
    [self.navigationController pushViewController:self.firstVC animated:YES];
}





@end
