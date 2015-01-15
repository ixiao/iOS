//
//  ViewController.m
//  第十章-操作队列-story
//
//  Created by 闫潇 on 15/1/13.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "MyOperation.h"
#import "MyProgressOperation.h"
#import "FetchMoney.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 三个线程的操作队列方法
- (IBAction)threadOperation:(id)sender {
    //创建操作1
    MyOperation * operation1 = [MyOperation new];
    operation1.name=@"线程1";
    //创建操作2
    MyOperation * operation2 = [MyOperation new];
    operation2.name=@"线程2";
    //创建操作3
    MyOperation * operation3 = [MyOperation new];
    operation3.name=@"线程3";
    
    
    //创建操作队列
    NSOperationQueue * queue = [NSOperationQueue new];
    queue.maxConcurrentOperationCount=1;
    //提升线程优先级
    [operation3 setQueuePriority:NSOperationQueuePriorityVeryHigh];
    
    //设置依赖，线程3依赖线程2，必须线程2执行完后执行线程3，不管线程3有没有提升优先级
    [operation3 addDependency:operation2];
    
    //把所有的操作放入操作队列
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
}

#pragma mark 使用操作队列更新对读条
- (IBAction)updateProgressView:(id)sender {
    //创建操作对象
    MyProgressOperation * progressOperation1 = [MyProgressOperation new];
    self.progressView.progress=0;
    progressOperation1.delegate=self;
    
    NSOperationQueue * queue = [NSOperationQueue new];
    [queue addOperation:progressOperation1];
}

#pragma mark 使用操作队列完成取钱
- (IBAction)useOperationfetchMoney:(id)sender {
    //创建操作队列
    FetchMoney * husband = [FetchMoney new];
    husband.name = @"大丈夫";
    
    FetchMoney * wife = [FetchMoney new];
    wife.name = @"大老婆";
    //多线程操作队列，此句代码在往队列加入操作之前
    NSOperationQueue * operationQueue = [NSOperationQueue new];
    
    operationQueue.maxConcurrentOperationCount=1;
    [operationQueue addOperation:husband];
    [operationQueue addOperation:wife];
    
    
    
    
    //NSOperation对象是一个single-shot（一次性）对象，当它执行完一遍后，便不能再次使用，下面代码出错！
//    NSOperationQueue *operationQueue2 = [[NSOperationQueue alloc]init];
//     [operationQueue2 addOperation:husband];
//     [operationQueue2 addOperation:wife];
    
}

@end
