//
//  ViewController.m
//  第八章-数据持久化
//
//  Created by 闫潇 on 15/1/5.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#define FILENAME @"my.text"
@interface ViewController ()
@property (nonatomic,strong) NSString * docPath;//沙盒文件路径
@property (nonatomic,strong) AVAudioPlayer * player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取沙盒Documents路径
    NSArray * docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    self.docPath = docPaths[0];
    NSLog(@"docPath:%@",self.docPath);
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 写入文件的方法
- (IBAction)WriteFile:(UIButton *)sender {
    NSError * error = nil;
    NSString *textFile = @"浔阳江头夜送客，枫叶荻花秋瑟瑟。主人下马客在船，举酒欲饮无管弦。醉不成欢惨将别，别时茫茫江浸月。忽闻水上琵琶声，主人忘归客不发。寻声暗问弹者谁？琵琶声停欲语迟。移船相近邀相见，添酒回灯重开宴。千呼万唤始出来，犹抱琵琶半遮面。";
    BOOL isOk = [textFile writeToFile:[self getPath] atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (isOk)
    {
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"提示" message:@"文件写入成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSLog(@"error:%@",[error localizedDescription]);
    }
}
#pragma mark 读取文件的方法
- (IBAction)ReadFile:(id)sender {
    
    NSError * error = nil;
    NSString * read = [NSString stringWithContentsOfFile:[self getPath] encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"error:%@",error);
        
    }
    else
    {
        NSLog(@"read:%@",read);
    }
}
- (IBAction)writeData:(id)sender {
    NSString * content =@"浔阳江头夜送客，枫叶荻花秋瑟瑟。主人下马客在船，举酒欲饮无管弦。醉不成欢惨将别，别时茫茫江浸月。忽闻水上琵琶声，主人忘归客不发。寻声暗问弹者谁？琵琶声停欲语迟。移船相近邀相见，添酒回灯重开宴。千呼万唤始出来，犹抱琵琶半遮面。lalalalalalal";
    NSData * data = [content dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    [data writeToFile:[self getPath] atomically:YES];
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"写入成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (IBAction)readData:(id)sender {
    NSData * data = [NSData dataWithContentsOfFile:[self getPath]];
    NSString * content = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",content);
}


#pragma mark 获取文件绝对路径
-(NSString *)getPath
{
    NSString * filePath = [self.docPath stringByAppendingPathComponent:FILENAME];
    return filePath;
}
- (IBAction)playMp3:(id)sender {
    //获取mp3文件路径
    NSString * mp3Path = [[NSBundle mainBundle]pathForResource:@"googbye" ofType:@"mp3"];
    //把文件放入缓存区
    NSData  * data = [NSData dataWithContentsOfFile:mp3Path];
    //通过缓存区创建AVPlayer  播放mp3
    static BOOL isPlayer = NO;
    isPlayer = !isPlayer;
    if (isPlayer)
    {
        NSError * error = nil;
        self.player = [[AVAudioPlayer alloc]initWithData:data error:&error];
        
        if (error)
        {
            NSLog(@"error:%@",error);
        }
        else
        {
            //播放mp3
            [self.player play];
        }
        
    }
    else
    {
        //停止播放 mp3
        [self.player stop];
    }
    
}

@end
