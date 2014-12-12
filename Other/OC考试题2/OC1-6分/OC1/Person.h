//
//  Person.h
//  OC1
//
//  Created by 闫潇 on 14-8-17.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy)NSString * name;
@property (nonatomic,assign)NSInteger age;
-(void)sayHello;
@end
