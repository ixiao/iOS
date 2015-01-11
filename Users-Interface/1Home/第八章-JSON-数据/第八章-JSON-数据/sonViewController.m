//
//  sonViewController.m
//  第八章-JSON-数据
//
//  Created by 闫潇 on 15/1/8.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "sonViewController.h"

@interface sonViewController ()

@end

@implementation sonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:self.tab];
    
    self.tab.dataSource = self;
    self.tab.delegate = self;
    // Do any additional setup after loading the view.
}

#pragma mark tableView datasoure
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"ID";
    UITableViewCell * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text=self.array[indexPath.row][@"name"];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
