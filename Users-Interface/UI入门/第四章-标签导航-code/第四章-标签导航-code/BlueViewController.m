//
//  BlueViewController.m
//  第四章-标签导航-code
//
//  Created by 闫潇 on 14/12/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

@end

@implementation BlueViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Third";
        self.view.backgroundColor = [UIColor blueColor];
        // Do any additional setup after loading the view.
        
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_discover@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discoverHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"Third";
    self.tabBarController.navigationItem.rightBarButtonItem=nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //把右导航按钮置成nil

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
