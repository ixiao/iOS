//
//  ViewController.m
//  第七章-通知-story
//
//  Created by 闫潇 on 15/1/4.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "RootViewController.h"
#import "common.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //每隔五秒发送一个通知
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(doSomething:) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 发送通知 把当前日期时间放在通知中心传送出去

-(void)doSomething:(NSTimer *)timer
{
    //准备通知发送的数据
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSString *now = [formatter stringFromDate:[NSDate date]];
    
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:DATETIME object:self userInfo:@{@"now":now}];
}

@end
