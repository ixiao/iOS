//
//  ScendViewController.m
//  第四章-导航控制器
//
//  Created by 闫潇 on 14/12/24.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ScendViewController.h"
#import "ThreeViewController.h"
@interface ScendViewController ()
@property (nonatomic,strong) ThreeViewController * ThreeVC;

@end

@implementation ScendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    //设置ViewController标题
    self.title = @"Scend";
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    //把右导航按钮加入导航栏
    self.navigationItem.rightBarButtonItem=rightButton;
    // Do any additional setup after loading the view.
}

-(void)next:(UIBarButtonItem *)sender
{
if (!self.ThreeVC)
{
    //当下个视图控制器对象不存在时才创建，保证只创建一次
    self.ThreeVC = [ThreeViewController new];
}
[self.navigationController pushViewController:self.ThreeVC animated:YES];

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
