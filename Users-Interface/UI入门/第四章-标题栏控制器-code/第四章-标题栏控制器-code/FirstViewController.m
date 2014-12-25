//
//  ViewController.m
//  第四章-标题栏控制器-code
//
//  Created by 闫潇 on 14/12/25.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
#pragma 初始化方法改变标签栏图标和标题
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.tabBarItem.image= [[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //改变背景颜色和标题
//    self.title = @"First";
    self.view.backgroundColor = [UIColor redColor];
    
    self.tabBarItem.title=@"微信";

    self.tabBarController.tabBar.tintColor= [UIColor greenColor];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma <#arguments#>
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
