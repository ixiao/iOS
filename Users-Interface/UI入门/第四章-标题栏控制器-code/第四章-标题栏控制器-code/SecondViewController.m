//
//  SecondViewController.m
//  第四章-标题栏控制器-code
//
//  Created by 闫潇 on 14/12/25.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@end

@implementation SecondViewController
#pragma 初始化方法改变标签栏图标和标题
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.tabBarItem.image= [[UIImage imageNamed:@"tabbar_contacts@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_contactsHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //改变背景颜色和标题
//    self.title = @"Second";
    self.view.backgroundColor = [UIColor blueColor];
    
    self.tabBarItem.title=@"通讯录";
    
    self.tabBarController.tabBar.tintColor= [UIColor greenColor];
    // Do any additional setup after loading the view.
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
