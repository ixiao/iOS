//
//  ViewController.h
//  OC9
//
//  Created by 徐赢 on 14-6-9.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 label使用方法
 首先创建对象
 Label * label = [[Label alloc] init];
 [label setText:@"123"];
 屏幕将会显示123
 [label setText:@"456"];
 屏幕将会显示456
 
 
 现在要求，在视图控制器中，有一个按钮和一个label，
 当奇数次点击按钮时，label显示1
 当偶数次点击按钮时，label显示0；
 
 例如，第一次点击，显示1，
 第二次点击，显示0，
 第三次点击显示1。
 
 */
@interface ViewController : NSObject

@end
