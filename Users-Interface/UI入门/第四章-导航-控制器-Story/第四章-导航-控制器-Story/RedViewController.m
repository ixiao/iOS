//
//  RedViewController.m
//  第四章-导航-控制器-Story
//
//  Created by 闫潇 on 14/12/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "RedViewController.h"
#import "RedViewController2.h"
@interface RedViewController ()
@property (nonatomic,strong) RedViewController2 * RedVC2;
@property (nonatomic,strong) UIBarButtonItem * rightButton;
@end

@implementation RedViewController
#pragma 从storyboard中唤醒当前类对象
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tabBarItem.title=@"微信";

    
    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

#pragma mark 视图将要出现时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.tintColor = [UIColor greenColor];

    //创建右导航按钮
    if (!self.rightButton)
    {
        self.tabBarController.navigationItem.title=@"First";
        UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
        self.tabBarController.navigationItem.rightBarButtonItem = rightButton;
    }
    
}
#pragma mark 导航方法
-(void)next:(UIBarButtonItem *)sender
{
    if (!self.RedVC2)
    {
        self.RedVC2 = [self.storyboard  instantiateViewControllerWithIdentifier:@"RedVC2"];
    }
    else
    {
        [self.tabBarController.navigationController pushViewController:self.RedVC2 animated:YES];
    }
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
