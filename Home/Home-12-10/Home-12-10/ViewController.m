//
//  ViewController.m
//  Home-12-10
//
//  Created by 闫潇 on 14/12/10.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"
#import "Button.h"
#import "Label.h"
#import "SourceManager.h"
@interface ViewController()
@property (nonatomic,strong)Button *button;
@property (nonatomic,strong)Label *label;
@property (nonatomic,strong)SourceManager *smn;
//1,当点击按钮时，让sourceManager请求数据
//2,如果请求成功，把数据显示在label上
//3，如果请求失败，把失败原因显示在label上
@end
@implementation ViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.button =[Button new];
        self.label =[Label new];
        [self.button setTitle:@"确定"];
        self.smn = [SourceManager new];
        [self.button addTapTarget:self Action:@selector(doButton:)];
    }
    return self;
}
-(void)doButton
{
    [self.smn qingqiuString];//点击button，让Sourcemanager 请求数据
    //请求完成以后，系统会自动回调两个set 方法
    //2,如果请求成功，把数据显示在label上
    __weak  __block ViewController *copySelf=self;
    [self.smn  setDidReceiveStringBlock:^
     (NSString * str ) = {
         [copySelf.Label ]
     }];
}
@end
