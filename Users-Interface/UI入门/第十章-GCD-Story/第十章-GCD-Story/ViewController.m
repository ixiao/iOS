//
//  ViewController.m
//  第十章-GCD-Story
//
//  Created by 闫潇 on 15/1/13.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 使用后GCD更新进度条
- (IBAction)updateProgressView:(id)sender {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i<100; i++)
        {
            //让当前线程的runloop停止0.02秒
            [NSThread  sleepForTimeInterval:0.02f];
            //在主线程更新UI
                dispatch_async(dispatch_get_main_queue(),^{
                    self.progressView.progress +=0;
                });
                               
        }
    });
}
#pragma mark GCD并发多线程完成任务
- (IBAction)aSyDowork:(id)sender {
    //获取始终可用的全局队列
    dispatch_queue_t global_queue = dispatch_get_global_queue(0, 0);
    //获取主线程队列
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    
    
    NSMutableString * mStr = [NSMutableString new];
    //任务一
    dispatch_async(global_queue, ^{
        [mStr appendFormat:@"%@\n",[self doWork1]];
        
        //主线程中 更新UI
        dispatch_async(main_queue, ^{
            self.textView.text=mStr;
        });
    });
    
//    NSMutableString * mStr = [NSMutableString new];
    //任务二
    dispatch_async(global_queue, ^{
        [mStr
         appendFormat:@"%@\n",[self doWork2]];
        
        //主线程中 更新UI
        dispatch_async(main_queue, ^{
            self.textView.text=mStr;
        });
    });
    
//    NSMutableString * mStr = [NSMutableString new];
    //任务三
    dispatch_async(global_queue, ^{
        [mStr appendFormat:@"%@\n",[self doWork3]];
        
        //主线程中 更新UI
        dispatch_async(main_queue, ^{
            self.textView.text=mStr;
        });
    });
    
    
    //在主线程中更新UI,如下代码同步等待主线程中按钮点击事件完成才进行，主线程中按钮点击事件等待如下代码完成，造成阻塞
    /*dispatch_sync(globalQueue, ^{
     dispatch_sync(mainQueue, ^{
     self.textView.text = strWork;
     });
     });*/
    dispatch_async(global_queue, ^{
        dispatch_async(main_queue, ^{
            self.textView.text = mStr;
        });
    });
    
    //同步可以在任务完成后 集中更新UI，异步不可以
    
}
#pragma mark GCD同步完成任务
- (IBAction)syncognize:(id)sender {
}
#pragma mark 分组派发
- (IBAction)fenZuPaiFa:(id)sender {
    self.textView.text = @"";
    NSMutableString *strWork = [NSMutableString stringWithCapacity:20];
    //创建组和队列
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    //队列在组中执行操作
    dispatch_group_async(group, globalQueue, ^{
        [strWork appendFormat:@"%@\n",[self doWork1]];
        NSLog(@"doWork1");
    });
    dispatch_group_async(group, globalQueue, ^{
        [strWork appendFormat:@"%@\n",[self doWork2]];
        NSLog(@"doWork2");
    });
    dispatch_group_async(group, globalQueue, ^{
        [strWork appendFormat:@"%@\n",[self doWork3]];
        NSLog(@"doWork3");
    });
    //通知组中任务完成在主线程中更新UI
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        self.textView.text = strWork;
    });
}

#pragma mark 任务1
- (NSString *)doWork1 {
    [NSThread sleepForTimeInterval:2.0f];
    return @"任务1完成！";
}
#pragma mark 任务2
- (NSString *)doWork2 {
    [NSThread sleepForTimeInterval:3.0f];
    return @"任务2完成！";
}
#pragma mark 任务3
- (NSString *)doWork3 {
    [NSThread sleepForTimeInterval:4.0f];
    return @"任务3完成！";
}
@end
