//
//  Student.h
//  P127
//
//  Created by 闫潇 on 14/12/7.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkProtocol.h"
@interface Student : NSObject<WorkProtocol>
-(id)initWithName:(NSString *)aName andAge:(NSUInteger)anAge;//遍历构造函数
+(id)studentWithName:(NSString *)aName anAge:(NSUInteger)anAge;//遍历构造器

@end
