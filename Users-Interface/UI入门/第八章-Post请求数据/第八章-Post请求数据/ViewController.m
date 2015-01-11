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
    self.textFiled.inputView = [[UITableView alloc]initWithFrame:CGRectZero];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)synchnizePst:(UIButton *)sender {
    //创建url
    NSURL * url = [NSURL URLWithString:@"http://xiaobar.lofter.com/rss"];
    //根据url创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //指定请求方式为POST方式
    [request setHTTPMethod:@"POST"];
    //指定请求字符串
    NSString *requestStr = @"type=focus-c";
    //把请求字符串转换成缓冲区
    NSData *requestData = [requestStr dataUsingEncoding:NSUTF8StringEncoding];
    //指定请求体
    [request setHTTPBody:requestData];
    NSURLResponse *response = nil;
    NSError *error = nil;
    //根据请求创建同步连接下载数据
    NSData *receiveData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //收到数据处理
    if (error) {
        NSLog(@"error:%@",error);
    } else {
        NSLog(@"response:%@",response);
        NSString *content = [[NSString alloc]initWithData:receiveData encoding:NSUTF8StringEncoding];
        self.textFiled.text = content;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
