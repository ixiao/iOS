//
//  ViewController.m
//  第八章-Post请求数据
//
//  Created by 闫潇 on 15/1/7.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFiled.inputView = []
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)synchnizePst:(UIButton *)sender {
    //创建URL
    NSURL * url = [NSURL URLWithString:@"http://api.hudong.com/iphonexml.do?type=focus-c]"];
    NSURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    //指定http请求是post方式

    
    //建立NSURLConnection发送同步请求
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * receiveData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //得到数据之后
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
