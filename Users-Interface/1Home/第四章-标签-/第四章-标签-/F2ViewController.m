//
//  F2ViewController.m
//  第四章-标签-
//
//  Created by 闫潇 on 14/12/28.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "F2ViewController.h"
#import "Second1ViewController.h"
@interface F2ViewController ()
@property (nonatomic,strong) Second1ViewController * secondVC;
@property (nonatomic,strong) UIBarButtonItem * rightButton;
@end

@implementation F2ViewController
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tabBarItem.title = @"通讯录";
    self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_contacts@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_contactsHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    if (!self.rightButton)
    {
        self.tabBarController.navigationItem.title=@"皮卡丘";
        self.rightButton = [[UIBarButtonItem alloc]initWithTitle:@"去吧" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
        
    }
    self.tabBarController.navigationItem.rightBarButtonItem=self.rightButton;
}
-(void)next:(UIBarButtonItem *)sender
{
    if (!self.secondVC)
    {
        self.secondVC=[self.storyboard instantiateViewControllerWithIdentifier:@"110"];
        
    }
    [self.tabBarController.navigationController pushViewController:self.secondVC animated:YES];
    
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
