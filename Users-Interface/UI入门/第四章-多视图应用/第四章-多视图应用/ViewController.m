//
//  ViewController.m
//  第四章-多视图应用
//
//  Created by 李麻麻 on 14-12-24.
//  Copyright (c) 2014年 李麻麻. All rights reserved.
//

#import "ViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"
@interface ViewController ()
@property (strong,nonatomic)YellowViewController *yellowC;
@property (strong,nonatomic)BlueViewController *blueC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    // Do any additional setup after loading the view, typically from a nib.
 
}
-(void)setUp
{
      //创建界面控件
    //创建工具栏
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, 320, 44)];
    //创建工具栏上的按钮
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"切换视图"style:UIBarButtonItemStyleBordered target:self action:@selector(doBarButtonItem:)];
    //把按钮加入工具栏
    toolBar.items = @[barButtonItem];
    //把工具栏加入视图=v
    [self.view addSubview:toolBar];
    
    self.yellowC = [YellowViewController new];
    self.blueC = [BlueViewController new];
    //设置黄色视图为初始视图
    [self.view insertSubview:self.yellowC.view atIndex:0];
}
#pragma mark 切换视图
-(void)doBarButtonItem:(UIBarButtonItem *)sender
{
    if (self.yellowC.view.superview == nil)
    {
        [self.blueC.view removeFromSuperview];
        [self.view insertSubview:self.yellowC.view atIndex:0];
    }
    else
    {
        [self.yellowC.view removeFromSuperview];
        [self.view insertSubview:self.blueC.view atIndex:0];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
