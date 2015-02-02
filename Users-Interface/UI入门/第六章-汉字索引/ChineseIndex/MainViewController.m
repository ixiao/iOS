//
//  MainViewController.m
//  CitiesTableView
//
//  Created by hejin on 13-12-13.
//  Copyright (c) 2013年 e世雕龙. All rights reserved.
//

#import "MainViewController.h"
#import "ChineseIndex.h"

@interface MainViewController ()

@property (strong, nonatomic) NSDictionary *cities;//城市字典
@property (strong, nonatomic) NSArray *keys;//所有的键数组

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //创建表视图对象
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //给表视图指定数据源和委托
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    //获取数据源(读取plist文件，将数据放入城市数组)
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"city" ofType:@"plist"];
    NSArray *cities = [NSArray arrayWithContentsOfFile:filePath];
    NSDictionary *dict = [ChineseIndex groupedChineseCharacter:cities];//将城市分组
    self.keys = [[dict allKeys]sortedArrayUsingSelector:@selector(compare:)];
    self.cities = dict;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma -mark tableView dataSource methods
//该数据源方法指定表视图有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.keys.count;
}
//该数据源方法指定表视图每个分区有几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *currentKey = [self.keys objectAtIndex:section];
    NSArray *currentGroup = [self.cities objectForKey:currentKey];
    return currentGroup.count;
}
//该数据源方法指定表视图如何显示数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建可重用标识符
    static NSString *cellIdentifier = @"cellIdentifier";
    //首先从出列可重用队列中获取单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //如果没有才创建单元格对象
    if (!cell) {
        static int i = 0;
        i++;
        NSLog(@"生成%d个单元格",i);
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //给单元格文本标签赋值
    NSString *currentKey = [self.keys objectAtIndex:indexPath.section];
    NSArray *currentGroup = [self.cities objectForKey:currentKey];
    cell.textLabel.text = [currentGroup objectAtIndex:indexPath.row];
    return cell;
}
//该数据源方法给表视图每个分区Header添加标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.keys objectAtIndex:section];
}
//该数据源方法给表视图添加分区索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.keys;
}
@end









