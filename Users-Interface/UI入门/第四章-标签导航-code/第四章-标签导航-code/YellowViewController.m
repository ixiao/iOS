//
//  YellowViewController.m
//  第四章-标签导航-code
//
//  Created by 闫潇 on 14/12/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "YellowViewController.h"
#import "YellowViewController-2.h"

@interface YellowViewController ()
@property (nonatomic,strong) YellowViewController_2 * YellowVC2;
@property (nonatomic,strong) UIBarButtonItem * rightButton;
@end

@implementation YellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"Scend";
//    self.view.backgroundColor = [UIColor yellowColor];
//    // Do any additional setup after loading the view.
//    self.tabBarController.tabBar.tintColor = [UIColor yellowColor];
//    
//    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_contacts@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_contactsHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Scend";
        self.view.backgroundColor = [UIColor yellowColor];
        // Do any additional setup after loading the view.
        
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_contacts@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_contactsHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
#pragma mark 视图将要出现时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title=@"Second";

    //创建右导航按钮
    if (!self.rightButton)
    {

        UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
        self.tabBarController.navigationItem.rightBarButtonItem = rightButton;
    }
    
}
-(void)next:(UIBarButtonItem *)sender
{
    if (!self.YellowVC2)
    {
        self.YellowVC2 = [YellowViewController_2 new];
    }
    
    
        [self.tabBarController.navigationController pushViewController:self.YellowVC2 animated:YES];
    
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
