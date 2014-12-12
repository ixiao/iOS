//
//  ViewController.m
//  UI控件11-18
//
//  Created by 闫潇 on 14/11/18.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"zhangsan" forKey:@"name"];
    [defaults setObject:@"12" forKey:@"age"];
    [defaults synchronize];
    NSString * name = [defaults objectForKey:@"name"];
    NSLog(@"name = %@",name);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
