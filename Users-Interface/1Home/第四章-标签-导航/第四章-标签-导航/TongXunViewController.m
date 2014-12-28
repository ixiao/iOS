//
//  TongXunViewController.m
//  第四章-标签-导航
//
//  Created by 闫潇 on 14/12/27.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "TongXunViewController.h"
#import "SecondViewController.h"
@interface TongXunViewController ()
@property (nonatomic,strong) SecondViewController * SecondVC;
@property (nonatomic,strong) UIBarButtonItem * rightButton;
@end

@implementation TongXunViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"通讯录";
        self.view.backgroundColor = [UIColor greenColor];
        self.tabBarItem.image =[[UIImage imageNamed:@"tabbar_contacts@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage=[[UIImage  imageNamed:@"tabbar_contactsHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
#pragma mark 视图将要出现时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //创建右导航按钮
    if (!self.SecondVC)
    {
        self.SecondVC = [SecondViewController new];
        self.tabBarController.navigationItem.title = @"通讯录";
        UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"前往" style:UIBarButtonItemStylePlain target:self action:@selector(doButton:)];
        self.tabBarController.navigationItem.rightBarButtonItem=rightButton;
        
    }
}
#pragma mark 右导航
-(void)doButton:(UIBarButtonItem *)sender
{
    if (!self.SecondVC) {
        self.SecondVC = [SecondViewController new];
        
    }
    [self.tabBarController.navigationController pushViewController:self.SecondVC animated:YES];
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
