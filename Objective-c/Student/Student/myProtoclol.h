//
//  myProtoclol.h
//  Student
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol myProtoclol <NSObject>
@required//必须实现的方法
-(int)addx:(int)x addy:(int)y;

@optional//可选实现的方法
-(int)subx:(int)x addy:(int)y;
@end
