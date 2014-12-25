//
//  FirstViewController.m
//  第四章-导航控制器
//
//  Created by 闫潇 on 14/12/24.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "FirstViewController.h"
#import "ScendViewController.h"
#import "ViewController.h"
@interface FirstViewController ()
@property (nonatomic,strong) ScendViewController * ScendVC;
@property (nonatomic,strong) ViewController * modelVC;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //设置ViewController标题
    self.title = @"First";
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    //把右导航按钮加入导航栏
    self.navigationItem.rightBarButtonItem=rightButton;
    
    //创建按钮  放入视图中心
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame= CGRectMake(0, 0, 200, 30);
    button.center = self.view.center;
    [button setTitle:@"弹出模态视图" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(showModel:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}
#pragma  弹出模态视图
-(void)showModel:(UIButton *)sender
{
    if (!self.modelVC)
    {
        self.modelVC = [ViewController new];
        
    }
    self.modelVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:self.modelVC animated:YES completion:^{
        NSLog(@"成功弹出");
    }];
}
-(void)next:(UIBarButtonItem *)sender
{
    if (!self.ScendVC)
    {
        //当下个视图控制器对象不存在时才创建，保证只创建一次
        self.ScendVC = [ScendViewController new];
        
    }
    //导航到下一个视图控制器 (把scendVC压入导航栈)
    [self.navigationController pushViewController:self.ScendVC animated:YES];
    
    

    
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
