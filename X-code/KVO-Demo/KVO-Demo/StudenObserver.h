//
//  StudenObserver.h
//  KVO-Demo
//
//  Created by 闫潇 on 14/12/11.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
@interface StudenObserver : NSObject
@property (nonatomic,strong) Student * stu;
//遍历初始化函数
-(id)initWithStudent:(Student *)newStu;
@end
