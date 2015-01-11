//
//  ViewController.m
//  第八章-代码块-异步下载
//
//  Created by 闫潇 on 15/1/8.
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
#pragma mark 异步请求代码块方法
- (IBAction)BlockDown:(UIButton *)sender {
    //创建异步请求
    NSURL * url = [NSURL URLWithString:@"http://ww4.sinaimg.cn/mw1024/ae1f5766jw1empu5e6v6pj20f00qogmo.jpg"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    //发送异步请求
    NSOperationQueue * oprationQueue = nil;
    [NSURLConnection sendAsynchronousRequest:request queue:oprationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //获取响应的数据进行处理
        if (connectionError) {
            NSLog(@"error:%@",[connectionError localizedDescription]);
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"出错啦" message:@"服务端忙，请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            //更新UI操作一定要在主线程中
            //使用GCG获取主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                self.myImageView.image = [UIImage imageWithData:data];
            });
            
            
            
        }
    }];
}


//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
