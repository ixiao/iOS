//
//  BlueViewController.m
//  第四章-导航-控制器-Story
//
//  Created by 闫潇 on 14/12/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma 从storyboard中唤醒当前类对象
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tabBarItem.title=@"发现";
//    self.tabBarController.tabBar.tintColor = [UIColor yellowColor];
    
    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_discover@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discoverHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
#pragma mark 视图将要出现时
-(void)viewWillAppear:(BOOL)animated
{

    self.tabBarController.navigationItem.title = @"Third";
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.rightBarButtonItem=nil;
    
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
