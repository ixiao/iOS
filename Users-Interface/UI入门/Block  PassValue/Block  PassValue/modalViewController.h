//
//  ViewController.h
//  Block  PassValue
//
//  Created by Fan Tengfei on 15/1/4.
//  Copyright (c) 2015年 Fan Tengfei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyBlock)(NSString *name);  //声明代码块类型

@interface modalViewController : UIViewController
@property(strong,nonatomic)NSString *name;   //传过来的需要修改的数据
@property(copy,nonatomic)MyBlock myBlock;    //传过来的代码块

//便利初始化函数
-(void)initWithBlock:(MyBlock)myBlock;


@end
