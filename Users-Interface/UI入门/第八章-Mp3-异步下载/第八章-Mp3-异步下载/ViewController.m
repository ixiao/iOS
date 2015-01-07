//
//  ViewController.m
//  第八章-Mp3-异步下载
//
//  Created by 闫潇 on 15/1/7.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic,strong) NSMutableData * mp3Data;//存放下载mp3数据
@property (nonatomic,assign) float  mp3Lentgh;//mp3 总大小
@property (nonatomic,assign) float  mp3CurrentLength;//当前已经下载的大小
@property (nonatomic,strong) AVAudioPlayer * Mp3Player;//播放器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)downMusic:(UIButton *)sender {
    //异步连接Get请求mp3下载
    NSString * filePath = @"http://music.hao123.com/data/music/file?link=http://yinyueshiting.baidu.com/data2/music/123297915/1201250291420430461128.mp3?xcode=283ca32d399633bced0afeb1a7a3796ca6a03c85c06f4409&song_id=120125029";//小苹果
    //创建url
    NSURL * url = [NSURL URLWithString:filePath];
    //通过url创建request
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    // 通过NSURLConnection进行异步连接
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.mp3Data = [NSMutableData new];
    self.mp3Lentgh = [response expectedContentLength];
    
}

//接受到数据之后调用 ，会调用多次 data参数就是每次获取的数据块
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.mp3Data appendData:data];
    self.mp3CurrentLength = [self.mp3Data length];
    self.progressView.progress = self.mp3CurrentLength/self.mp3Lentgh;
}
//
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.progressView.progress=1;
    
    NSError * error = nil;
    self.Mp3Player=[[AVAudioPlayer alloc]initWithData:self.mp3Data error:&error];
    if (error)
    {
        NSLog(@"error:%@",[error localizedDescription]);
    }
    else
    {
        [self.Mp3Player play];
    }
}

//-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"下载错误" message:[e] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//}
//来自其父协议，连接发生错误时所要调用的方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"下载错误！" message:[error localizedDescription] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
