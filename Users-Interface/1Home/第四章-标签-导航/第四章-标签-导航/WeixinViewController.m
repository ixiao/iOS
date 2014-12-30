//
//  ViewController.m
//  第四章-标签-导航
//
//  Created by 闫潇 on 14/12/27.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "WeixinViewController.h"

@interface WeixinViewController ()

@end

@implementation WeixinViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"微信";
        self.view.backgroundColor = [UIColor orangeColor];
        
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_discover@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discoverHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{

    self.tabBarController.navigationItem.rightBarButtonItem=nil;
//    self.tabBarController.navigationItem.rightBarButtonItem=nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBarController.navigationItem.title=@"微信";
    self.tabBarController.tabBar.tintColor=[UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
