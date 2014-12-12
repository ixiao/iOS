//
//  ViewController.m
//  Home-128
//
//  Created by 闫潇 on 14/12/8.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"
#import "Button.h"
#import "Label.h"
#import "Player.h"
//1,当点击按钮时，使用sourceManage对象请求url
//2,如果请求成功，把url显示在label上，并且用player对象播放该url
//3，如果请求失败，在label上显示失败原因
//4，当播放完成时，在label上显示播放完成
@interface ViewController()
@property (nonatomic,strong)Button *button;
@property (nonatomic,strong)Label *label;
@property (nonatomic,strong)Player *player;
@property (nonatomic,strong)SourceManager *smn;
-(void)tapButton:(Button *)button;

@end

@implementation ViewController
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.button = [Button new];//初始化按钮
        [self.button addTapTarget:self Action:@selector(tapButton:)];
        self.label=[Label new];//初始化标签属性
        self.smn = [SourceManager new];//初始化业务逻辑对象
        self.smn.delegate=self;//指定委托
        self.player = [Player new];//初始化播放属性
        //在代码块中使用self 一定要做如下处理：
        __weak __block ViewController *copyself=self;
        [self.player setDidFinishBlock:^{
        //4.当播放完成时，在Label上显示播放完成
            [copyself.label setText:@"播放完成"];
        }];
    }
    return self;
}
//点击按钮时触发的方法
-(void)tapButton:(Button *)button
{
    //1.当点击按钮时，使用SourceManager请求url
    [self.smn qingqiuMusicURl];
}
-(void)sourceManager:(SourceManager *)sm didReceiveURL:(NSString *)url
{
    //2.如果请求成功，把url显示在label上，并且用player对象播放该url
    [self.label setText:url];
    [self.player playWithURL:url];
}
-(void)sourceManager:(SourceManager *)sm didReceiveError:(NSError *)error
{
    //3.如果请求失败，在url上显示失败原因
    NSString * reason = [error localizedDescription];
    [self.label setText:reason];
    
}
@end





