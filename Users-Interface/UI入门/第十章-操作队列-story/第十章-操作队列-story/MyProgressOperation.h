//
//  MyProgressOperation.h
//  第十章-操作队列-story
//
//  Created by 闫潇 on 15/1/13.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
@interface MyProgressOperation : NSOperation
@property (nonatomic,strong) ViewController * delegate;
@end
