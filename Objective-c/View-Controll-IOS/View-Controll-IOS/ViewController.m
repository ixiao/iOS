//
//  ViewController.m
//  OC-ywlj3
//
//  Created by 徐赢 on 14-9-11.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import "ViewController.h"
#import "Button.h"
#import "Label.h"
@interface ViewController ()
@property (nonatomic,strong) Button * button;
@property (nonatomic,strong) Label * label;
@property (nonatomic,strong) SourceManager * sourcemanager;

@end
@implementation ViewController
-(instancetype)init
{
    self= [super init];
    if (self)
    {
        self.label= [Label new];
        self.button=[Button new];
        [self.button addTapTarget:self Action:@selector(tapButton:)];
        
        self.sourcemanager=[SourceManager new];
        [self.sourcemanager delegate];
    }
    return self;

}
#pragma Button 的目标动作回调方法
-(void)tapButton:(Button *)button;
{
    [self.sourcemanager qingqiuString];
}
#pragma Sourcemanager 的委托模式回调方法
-(void)sourceManager:(SourceManager *)sm didReceiveString:(NSString *)string
{
    [self.label setText:string];
}
-(void)sourceManager:(SourceManager *)sm didReceiveError:(NSError *)error
{
    NSString * errorReason = [error localizedDescription];
    [self.label setText:errorReason];
}
@end
