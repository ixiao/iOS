//
//  ViewController.m
//  Demo2
//
//  Created by 闫潇 on 14/11/17.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView * scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    for (int i = 0; i<=11; i++)
    {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(320*i, 0, 320, 210)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [scroll addSubview:imgView];
    }
    
    [scroll setContentSize:CGSizeMake(320*12, 210)];
    scroll.directionalLockEnabled = YES;
    scroll.bounces = NO;
    scroll.alwaysBounceVertical = NO;
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
