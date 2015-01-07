//
//  ViewController.h
//  第七章-代码块
//
//  Created by 闫潇 on 15/1/4.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MyBlock)(NSString * name);//声明代码块类型
@interface DeatilViewController : UIViewController
@property (nonatomic,strong) NSString * name;//传过来需要修改的数据
@property (nonatomic,strong) MyBlock myBlock;//传过来的代码块对象
//遍历初始化函数
-(id)initWithBlock:(MyBlock)myBlock;
@end

