//
//  ViewController.m
//  第十章-多线程
//
//  Created by 闫潇 on 15/1/13.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 使用线程的三中方法
- (IBAction)useThread:(id)sender {
    //方式一
    //创建线程
    NSThread * t1 = [[NSThread alloc]initWithTarget:self
                                           selector:@selector(doWork) object:nil];
    [t1 start]; //必须手动启动线程
    
    //方式二(自动启用线程)
    [NSThread detachNewThreadSelector:@selector(doWork) toTarget:self withObject:nil];
    //方法三(自动启用线程)
    [self performSelectorInBackground:@selector(doWork) withObject:nil];
    
}
#pragma mark  线程完成的工作
-(void)doWork
{
    for (int i =1 ; i<1000; i++)
    {
        NSLog(@"%@%d",[NSThread currentThread],i);
    }
}
#pragma mark 更新进度条
- (IBAction)updata:(id)sender {
    //创建线程
    NSThread * t = [[NSThread alloc]initWithTarget:self selector:@selector(updateProgress) object:nil];
    //启动线程
    [t start];
}
#pragma mark 更新进度条
-(void)updateProgress
{
    self.progressView.progress=0;
    for (int i =0; i<100; i++)
    {
        //让当前线程的run loop 停止0.02秒
        [NSThread sleepForTimeInterval:0.02f];
        //在主线程中更新UI
        [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:YES];
    }
    
}
#pragma mark 更新UI
-(void)updateUI
{
    self.progressView.progress += 1.0/100;
}
#pragma mark 多线程取钱问题(线程同步)
- (IBAction)fechMoney:(id)sender {
    //创建线程一
    NSThread * husband = [[NSThread alloc]initWithTarget:self selector:@selector(fetchMoney:) object:@"大丈夫"];
//    启动线程一
    [husband start];
    
    //创建线程二
    NSThread * wife = [[NSThread alloc]initWithTarget:self selector:@selector(fetchMoney:) object:@"大老婆"];
    //启动线程二
    [wife start];
}
#pragma mark  取钱方法
-(void)fetchMoney:(NSString *)who
{
    static  int money = 10000;//余额
    //线程同步后，结果很混乱
//    NSLog(@"%@开始取钱,取前余额%d",who,money);
//    money -= 2000; //每次取出2000
//    NSLog(@"%@开始取钱,取后余额%d",who,money);
    
    //线程同步后,结果正常
    @synchronized(self){
    NSLog(@"%@开始取钱,取前余额%d",who,money);
    money -= 2000; //每次取出2000
    NSLog(@"%@开始取钱,取后余额%d",who,money);
    }
}
@end
