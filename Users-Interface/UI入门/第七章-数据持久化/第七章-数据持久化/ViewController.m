//
//  ViewController.m
//  第七章-数据持久化
//
//  Created by 闫潇 on 15/1/5.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#define FILENAME @"myFile.text"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (nonatomic,strong) NSString * docPath;//沙盒文件路径
@property (nonatomic,strong) AVPlayer * player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取应用程序沙盒Documents目录路径
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    self.docPath = docPaths[0];
    NSLog(@"docPath:%@",self.docPath);
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)NSString读文件:(UIButton *)sender {
    
    NSError * error = nil;
    NSString * content = [NSString stringWithContentsOfFile:self.docPath encoding:NSUTF8StringEncoding error:&error];
}

- (IBAction)NSString写文件:(UIButton *)sender {
    
    NSError *error = nil;
    	[
    BOOL isOK = [content writeToFile:[self getFilePath] atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (isOK)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"文件写入成功！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        NSLog(@"error:%@",[error localizedDescription]);
    }
}


- (IBAction)NSDataReadFile:(UIButton *)sender {
    NSData * data = [NSData dataWithContentsOfFile:self.docPath];
    NSString * content = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    
}


- (IBAction)NSDataWriteFile:(UIButton *)sender {
    
    NSString *content = @"浔阳江头夜送客，枫叶荻花秋瑟瑟。主人下马客在船，举酒欲饮无管弦。醉不成欢惨将别，别时茫茫江浸月。忽闻水上琵琶声，主人忘归客不发。寻声暗问弹者谁？琵琶声停欲语迟。移船相近邀相见，添酒回灯重开宴。千呼万唤始出来，犹抱琵琶半遮面。";
    NSData * data = [content dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:[self getFilePath] atomically:YES];
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"文件写入成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
#pragma mark 播放音乐
- (IBAction)playMp3:(UIButton *)sender {
    //首先获取mp3文件路径
    NSString * mp3Path = [[NSBundle mainBundle]pathForResource:@"goodbye" ofType:@"mp3"];
    //把mp3文件放入缓存区
    NSError * error = nil;
    NSData * data = [NSData dataWithContentsOfFile:self.docPath];
    //通过mp3缓存区创建AVPlayer对象播放mp3
    static BOOL isPlay = NO;
    isPlay = !isPlay;
    self.player = [[AVAudioPlayer alloc]initWithData:data error:&error];
    if (error)
    {
        NSLog(@"error:%@",[error localizedDescription]);
        
    }
    else
    {
        [self.player play];
    }


#pragma mark 获取文件绝对路径
-(NSString *)getFilePath
{
    NSString * filePath = [self.docPath stringByAppendingPathComponent:FILENAME];
    return filePath;
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
