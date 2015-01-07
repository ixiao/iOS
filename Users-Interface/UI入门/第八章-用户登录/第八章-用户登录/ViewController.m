//
//  ViewController.m
//  第八章-用户登录
//
//  Created by 闫潇 on 15/1/6.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtUserName;//用户名
@property (strong, nonatomic) IBOutlet UITextField *txtPass;//用户密码

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 登录
- (IBAction)login:(UIButton *)sender {
    
    //获取用户名和密码
    NSString * userName = self.txtUserName.text;
    NSString * password = self.txtPass.text;
    //此处应该发送网络请求，判断用户名和密码是否正确
    if ([@"admin" isEqualToString:userName]&&[@"admin"isEqualToString:password])
    {
        //登录成功把用户名和密码放入userDefaults 中
        NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:userName forKey:@"username"];
        [userDefault setObject:password forKey:@"password"];
        [userDefault synchronize];
        //跳转到mainViewController
        
        //获取
        MainViewController * mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
        //跳转
        [self presentViewController:mainVC animated:YES completion:nil];
    }
    else
    {
        //登录失败提示
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"用户名或密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
