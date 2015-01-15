//
//  MyOperation.h
//  第十章-操作队列-story
//
//  Created by 闫潇 on 15/1/13.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyOperation : NSOperation
@property (copy,atomic) NSString * name;//操作的名字
@end
