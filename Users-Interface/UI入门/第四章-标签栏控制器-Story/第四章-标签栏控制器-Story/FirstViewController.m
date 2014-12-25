//
//  ViewController.m
//  第四章-标签栏控制器-Story
//
//  Created by 闫潇 on 14/12/25.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
#pragma mark  从storyboard中唤醒对象调用的方法
-(void)awakeFromNib
{
    [super awakeFromNib];
    //改变表标签栏标题及颜色
    self.tabBarController.tabBar.tintColor = [UIColor greenColor];
    //改变标签栏默认图标和选中图标
    self.tabBarItem.image= [[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
