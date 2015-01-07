//
//  ViewController.h
//  第七章-代码块传值
//
//  Created by 闫潇 on 15/1/4.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyBlock)(NSString *name); //声明代码块的类型

@interface DeatilViewController : UIViewController
@property (nonatomic,strong) NSString * name;//传过来的需要修改的值
@property (copy,nonatomic) MyBlock myBlock;//传过来的代码块

-(instancetype)initWithBlock:(MyBlock)myBlock;
@end

