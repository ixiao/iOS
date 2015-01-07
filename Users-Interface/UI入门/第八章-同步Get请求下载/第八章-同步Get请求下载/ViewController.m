//
//  ViewController.m
//  第八章-同步Get请求下载
//
//  Created by 闫潇 on 15/1/7.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)synchronizedGet:(UIButton *)sender {
    //创建url
    NSURL *url = [NSURL URLWithString:@"http://ww4.sinaimg.cn/mw1024/ae1f5766jw1emmye9a0anj20i20cen01.jpg"];
    //通过url创建http请求（请求）
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    //建立NSURLConnetion发送同步请求
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * receiveData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //收到数据之后进行处理
    if (error)
    {
        NSLog(@"error:%@",[error localizedDescription]);
        
    }
    else
    {
        self.myImageView.image = [UIImage imageWithData:receiveData];
        NSLog(@"response:%@",response);//存放http响应头信息
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
