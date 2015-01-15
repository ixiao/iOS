//
//  MyProgressOperation.m
//  第十章-操作队列-story
//
//  Created by 闫潇 on 15/1/13.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "MyProgressOperation.h"

@implementation MyProgressOperation
#pragma mark 把操作队列回调此方法，完成进度条的更新
-(void)main
{
    //更新deledate中的进度条,注意更新UI在主线程中
    for (int i = 1; i<100; i++)
    {
        //当前线程的运行循环(runloop)停止0.02秒
        [NSThread sleepForTimeInterval:0.02f];
        //最后主线程中更新UI
        [self performSelectorOnMainThread:@selector(update) withObject:nil waitUntilDone:YES];
        
    }
}
-(void)update
{
    self.delegate.progressView.progress +=0.01;
}
@end
