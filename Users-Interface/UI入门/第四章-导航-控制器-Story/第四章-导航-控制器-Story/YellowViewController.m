//
//  YellowViewController.m
//  第四章-导航-控制器-Story
//
//  Created by 闫潇 on 14/12/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "YellowViewController.h"
#import "YellowViewController2.h"
@interface YellowViewController ()
@property (nonatomic,strong) YellowViewController2 * YellowVC2;
@property (nonatomic,strong) UIBarButtonItem * rightButton;
@end

@implementation YellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma 从storyboard中唤醒当前类对象
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tabBarItem.title=@"通讯录";

    
    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_contacts@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_contactsHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
#pragma mark 视图将要出现时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //创建右导航按钮
    if (!self.rightButton)
    {
        self.tabBarController.navigationItem.title=@"Second";
        UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
        self.tabBarController.navigationItem.rightBarButtonItem = rightButton;
    }
    
}
#pragma mark 导航方法
-(void)next:(UIBarButtonItem *)sender
{
    if (!self.YellowVC2)
    {
        self.YellowVC2 = [self.storyboard  instantiateViewControllerWithIdentifier:@"YellowVC2"];
    }
    else
    {
        [self.tabBarController.navigationController pushViewController:self.YellowVC2 animated:YES];
    }
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
