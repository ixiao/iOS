//
//  ScendViewController.m
//  第四章-标签栏控制器-Story
//
//  Created by 闫潇 on 14/12/25.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ScendViewController.h"

@interface ScendViewController ()

@end

@implementation ScendViewController
#pragma mark  从storyboard中唤醒对象调用的方法
-(void)awakeFromNib
{
    [super awakeFromNib];
    //改变表标签栏标题及颜色
    self.tabBarController.tabBar.tintColor = [UIColor greenColor];
    //改变标签栏默认图标和选中图标
    self.tabBarItem.image= [[UIImage imageNamed:@"tabbar_contacts@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//不受系统色系渲染的影响
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_contactsHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
#pragma 视图将要出现时隐藏标题栏
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
#pragma 视图将要出现时显示标题栏
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title=@"通讯录" ;
    // Do any additional setup after loading the view.
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
