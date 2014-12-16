//
//  Person.h
//  Student
//
//  Created by 闫潇 on 14/12/1.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myProtoclol.h"
@interface Person : NSObject<myProtoclol>
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSUInteger age;
@end
