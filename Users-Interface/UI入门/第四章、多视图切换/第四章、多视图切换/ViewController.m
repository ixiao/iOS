//
//  ViewController.m
//  第四章、多视图切换
//
//  Created by 闫潇 on 14/12/24.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"
#import "BlueViewController.h"
#import "GreenViewController.h"
@interface ViewController ()
@property (nonatomic,strong) BlueViewController * blueVC;
@property (nonatomic,strong) GreenViewController * greenVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建工具栏
    UIToolbar * toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, 320, 44)];
    //创建工具栏上的按钮
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"切换视图" style:UIBarButtonItemStyleBordered target:self action:@selector(doBarButton:)];
    //把按钮加入工具栏
    toolbar.items= @[barButtonItem];
    //把工具栏加入视图
    [self.view addSubview:toolbar];
    
    self.blueVC= [BlueViewController new];
    self.greenVC = [GreenViewController new];
    
    //设置黄色视图为初始视图
    [self.view insertSubview:self.blueVC.view atIndex:0];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma  切换视图 
-(void)doBarButton:(UIBarButtonItem *)sender
{
    if (self.blueVC.view==nil)
    {
        [self.greenVC.view removeFromSuperview];
        [self.view insertSubview:self.blueVC atIndex:0];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
