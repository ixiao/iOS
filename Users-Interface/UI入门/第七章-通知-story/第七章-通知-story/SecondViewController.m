//
//  SecondViewController.m
//  第七章-通知-story
//
//  Created by 闫潇 on 15/1/4.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "SecondViewController.h"
#import "common.h"
@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textFiled;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark 视图将要出现时订阅通知

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //通过通知中心订阅通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(doSomething:) name:DATETIME object:nil];
    
}
-(void)doSomething:(NSNotification *)notification
{
    //从通知中心获取数据  显示在界面文本框中
    NSString * now = [notification userInfo][@"now"];
    self.textFiled.text = now;
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
