//
//  ViewController.m
//  第四章-导航控制器
//
//  Created by 闫潇 on 14/12/24.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame= CGRectMake(0, 0, 200, 30);
    button.center = self.view.center;
    [button setTitle:@"关闭模态视图" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(closeModal:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)closeModal:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"关闭");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
