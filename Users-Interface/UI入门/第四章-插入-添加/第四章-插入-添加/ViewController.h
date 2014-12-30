//
//  ViewController.h
//  第四章-插入-添加
//
//  Created by 闫潇 on 14/12/30.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
@interface ViewController : UIViewController
@property (nonatomic,strong) NSDictionary * dic;//将要传入需要修改的值
@property (nonatomic,strong) TableViewController * delegate;//委托对象

@end

