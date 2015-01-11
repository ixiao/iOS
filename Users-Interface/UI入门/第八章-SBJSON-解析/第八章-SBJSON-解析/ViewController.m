//
//  ViewController.m
//  第八章-SBJSON-解析
//
//  Created by 闫潇 on 15/1/8.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "JSON.h"
@interface ViewController ()
@property (nonatomic,strong) UITableView * tableView;//表视图
@property (nonatomic,strong) NSMutableArray * students;//数据源
@property (nonatomic,strong) Student * student;//

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建表视图
    self.tableView= [[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
    //准备数据源
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 
-(void)passJSON
{
//    //获取JSON文件路径
//    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"students" ofType:@"json"];
//    //把JSON文件读取到NSData
//    NSError * error = nil;
//    NSData * data = [NSData dataWithContentsOfFile:filePath];
//
//    NSArray * student = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//    
//    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    //获取json文件路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"students" ofType:@"json"];
    //把json文件读入字符串
    NSError *error = nil;
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"error:%@",error);
    } else {
        //解析json串，放入json数组
        NSArray *jsonArray = [jsonString JSONValue];
        //遍历json数组，将其中字典对象变成Student对象,放入数据源students数组
        for (NSDictionary *dict in jsonArray) {
            Student *stu = [Student new];
            stu.name = [dict objectForKey:@"name"];
            stu.age = [[dict objectForKey:@"age"]intValue];
            stu.gender = [dict objectForKey:@"gender"];
            stu.remark = [dict objectForKey:@"remark"];
            [self.students addObject:stu];
        }
    }
}
#pragma mark tableView datasoure
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.students.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    //从数据源中获取学生对象
    Student *stu = self.students[indexPath.row];
    cell.textLabel.text = stu.name;
    cell.detailTextLabel.text = stu.remark;
    return cell;
    //设置单元格内容
    //主标题
    
//    cell.textLabel.text = self.students[indexPath.row][@"name"];
    //子标题
//    cell.detailTextLabel.text = self.students[indexPath.row][@"remark"];
}
@end
