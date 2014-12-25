//
//  ThirdViewController.m
//  第四章-标签栏控制器-Story
//
//  Created by 闫潇 on 14/12/25.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

#pragma mark  从storyboard中唤醒对象调用的方法
-(void)awakeFromNib
{
    [super awakeFromNib];
    //改变表标签栏标题及颜色
    self.tabBarController.tabBar.tintColor = [UIColor greenColor];
    //改变标签栏默认图标和选中图标
    self.tabBarItem.image= [[UIImage imageNamed:@"tabbar_discover@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//不受系统色系渲染的影响
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discover@2xHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


- (void)viewDidLoad {
    [super viewDidLoad];
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
