//
//  AboutViewController.m
//  TestHigh-MapCoreLocationCollectionVC
//
//  Created by 闫潇 on 15/1/29.
//  Copyright (c) 2015年 杨晋枝. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.navigationController.navigationBarHidden==YES) {
        self.navigationController.navigationBarHidden=NO;

    }
    else
        self.navigationController.navigationBarHidden=YES;
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
