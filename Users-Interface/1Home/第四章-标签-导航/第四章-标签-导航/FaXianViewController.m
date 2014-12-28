//
//  FaXianViewController.m
//  第四章-标签-导航
//
//  Created by 闫潇 on 14/12/27.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "FaXianViewController.h"
#import "ThirdViewController.h"
@interface FaXianViewController ()
@property (nonatomic,strong) ThirdViewController * ThirdVC;
@property (nonatomic,strong) UIBarButtonItem * rightButton;
@end

@implementation FaXianViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title=@"发现";
        self.view.backgroundColor=[UIColor yellowColor];
        self.tabBarItem.image=[[UIImage imageNamed:@"tabbar_discover@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_discoverHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
#pragma mark 视图将要出现
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.ThirdVC) {
        self.ThirdVC = [ThirdViewController new];
        self.ThirdVC.tabBarController.navigationItem.title=@"发现";
        UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"前往" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
        self.tabBarController.navigationItem.rightBarButtonItem=rightButton;
    }
}
#pragma mark 右导航按钮
-(void)next:(UIBarButtonItem *)sender
{
    if (!self.ThirdVC)
    {
        self.ThirdVC = [ThirdViewController new];
        
    }
    [self.tabBarController.navigationController pushViewController:self.ThirdVC animated:YES];
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
