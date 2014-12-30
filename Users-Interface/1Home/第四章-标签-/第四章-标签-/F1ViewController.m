//
//  ViewController.m
//  第四章-标签-
//
//  Created by 闫潇 on 14/12/28.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "F1ViewController.h"

@interface F1ViewController ()

@end

@implementation F1ViewController
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tabBarItem.title=@"微信";
    self.tabBarItem.image=[[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.tintColor=[UIColor greenColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
