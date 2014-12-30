//
//  ViewController.m
//  第四章-插入-添加
//
//  Created by 闫潇 on 14/12/30.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 视图将要出现时  从属性中取出数据展示在文本框中
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.textName.text = self.dic[@"name"];
}
#pragma mark 此方法完成回调委托类的某个方法 修改姓名
- (IBAction)moreName:(UIButton *)sender {
    //回调委托方法，修改视图
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"关闭模态视图");
    }];
}
#pragma mark 修改数据源中数据方法
- (void)moreName:(NSDictionary *)dict {
    // 1、从参数字典中获取修改后的数据
    NSIndexPath *indexPath = dict[@"indexPath"];
    NSString *name = dict[@"name"];
    // 2、更新数据源
    [self.list replaceObjectAtIndex:indexPath.row withObject:name];
    // 3、更新表视图
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
