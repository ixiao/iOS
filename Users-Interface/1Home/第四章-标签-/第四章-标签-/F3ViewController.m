//
//  F3ViewController.m
//  第四章-标签-
//
//  Created by 闫潇 on 14/12/28.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "F3ViewController.h"
#import "Second2ViewController.h"
@interface F3ViewController ()
@property (nonatomic,strong) Second2ViewController * second2VC;
@end

@implementation F3ViewController
-(void)awakeFromNib
{
    self.tabBarItem.title=@"发现";
    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_discover@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discoverHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
-(void)viewWillAppear:(BOOL)animated
{
    
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
