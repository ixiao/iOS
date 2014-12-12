//
//  Person.h
//  OC1
//
//  Created by Fan Tengfei on 14-8-18.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)int age;
-(void)sayhello;
@end
