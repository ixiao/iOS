//
//  RedViewController.m
//  第四章-标签导航-code
//
//  Created by 闫潇 on 14/12/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "RedViewController.h"
#import "RedViewController-2.h"

@interface RedViewController ()
@property (nonatomic,strong) RedViewController_2 * RedVC2 ;
@property (nonatomic,strong) UIBarButtonItem * rightButton;
@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.title = @"First";
//    self.view.backgroundColor = [UIColor redColor];
//    
//    //创建标签栏的标题 图标  标题 颜色
////    self.tabBarItem.title=@"First";
//    self.tabBarController.tabBar.tintColor = [UIColor yellowColor];
//    
//    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // Do any additional setup after loading the view.
}
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.title = @"First";
        self.view.backgroundColor = [UIColor redColor];
        
        //创建标签栏的标题 图标  标题 颜色
            self.tabBarItem.title=@"First";
        self.tabBarController.tabBar.tintColor = [UIColor yellowColor];
        
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
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
#pragma mark 右导航方法
-(void)next:(UIBarButtonItem *)sender
{
    if (!self.RedVC2)
    {
        self.RedVC2 = [RedViewController_2 new];
    }
    
    
        [self.tabBarController.navigationController pushViewController:self.RedVC2 animated:YES];
    
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
