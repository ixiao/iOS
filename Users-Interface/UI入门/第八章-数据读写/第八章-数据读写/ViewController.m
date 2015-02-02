//
//  ViewController.m
//  第八章-数据读写
//
//  Created by 闫潇 on 15/1/6.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 数据写入plist
- (IBAction)ArrayWrite:(id)sender {
    NSArray * array = @[@"hello",@"world",@"hehe",@"哈哈"];
    [array writeToFile:[self getFilePath:@"array.plist"] atomically:YES];
    [self alert];
}
#pragma mark

- (IBAction)ArrayRead:(id)sender {
}
#pragma mark

- (IBAction)DicWrite:(id)sender {
    NSDictionary *  dic=  @{@"haha":@"哈哈",
                            @"hello":@"你好",
                            @"world":@"世界"};
    [dic writeToFile:[self getFilePath:@"dic.plist"] atomically:YES];
    [self alert];
}
#pragma mark

- (IBAction)dicRead:(id)sender {
}
#pragma mark

- (IBAction)objWrite:(id)sender {
    //创建学生对象
    Student * stu = [Student new];
    stu.name = @"xiao";
    stu.age = 22;
    stu.adress=@"🌍";
    // 创建一个字典 包含对象中那些想成为字典中键的属性
    NSArray * wantToKeys = @[@"name",@"age",@"adress"];
    //将学生对象变成字典
    NSDictionary * stuDic = [stu dictionaryWithValuesForKeys:wantToKeys];
    [stuDic writeToFile:[self getFilePath:@"stu.plist"] atomically:YES];
    NSLog(@"stuDic:%@",stuDic);
}
#pragma mark

- (IBAction)objRead:(id)sender {
    // 首先从plist文件中读出字典
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[self getFilePath:@"stu.plist"]];
    // 通过字典创建学生对象
    Student *stu = [[Student alloc]initWithDict:dict];
    NSLog(@"stu:%@",stu);
    
}
#pragma mark 获取文件绝对路径
- (NSString *)getFilePath:(NSString *)fileName {
    // 获取documents目录数组
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 获取document目录
    NSString *docPath = docPaths[0];
    // 组合文件完整路径返回
    NSString *filePath = [docPath stringByAppendingPathComponent:fileName];
    NSLog(@"filePath:%@",filePath);
    return filePath;

}
#pragma mark 文件写入成功弹出的提示窗口
-(void)alert
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"文件写入成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
