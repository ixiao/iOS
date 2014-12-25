//
//  ThreeViewController.m
//  第四章-导航控制器
//
//  Created by 闫潇 on 14/12/24.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    //设置ViewController标题
    self.title = @"three";
    
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"toFirst" style:UIBarButtonItemStylePlain target:self action:@selector(toFirst:)];
    //把右导航按钮加入导航栏
    self.navigationItem.rightBarButtonItem=rightButton;
    // Do any additional setup after loading the view.
}
-(void)toFirst:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
