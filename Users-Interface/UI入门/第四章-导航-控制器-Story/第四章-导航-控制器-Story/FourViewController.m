//
//  ViewController.m
//  第四章-导航-控制器-Story
//
//  Created by 闫潇 on 14/12/26.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tabBarItem.title = @"我";
    
    self.tabBarItem.image=[[UIImage imageNamed:@"tabbar_me@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_meHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
