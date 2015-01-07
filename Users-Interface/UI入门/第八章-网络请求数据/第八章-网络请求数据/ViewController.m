//
//  ViewController.m
//  第八章-网络请求数据
//
//  Created by 闫潇 on 15/1/7.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //给textView设定自定义键盘，是没有可视区域的UIView，所以看起来像textView得到焦点但是没有弹出键盘一样
    self.textView.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 获取远程文本内容
- (IBAction)getText:(UIButton *)sender {
    NSURL * url = [NSURL URLWithString:@"http://www.ixiao.pw"];
    NSError * error = nil;
    self.textView.text = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
}

#pragma mark 获取远程二进制内容
- (IBAction)getRemoteData:(UIButton *)sender {
    NSURL * url = [NSURL URLWithString:@"http://ww4.sinaimg.cn/mw690/ae1f5766jw1ekbav71i09j20hs08wmxq.jpg"];
    
    NSData * data = [NSData dataWithContentsOfURL:url];
    self.imageView.image=[UIImage imageWithData:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
