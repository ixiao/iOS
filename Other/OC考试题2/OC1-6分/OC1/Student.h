//
//  Student.h
//  OC1
//
//  Created by 闫潇 on 14-8-17.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import "Person.h"

@interface Student : Person
@property  (nonatomic,copy) NSString * group;
@property (nonatomic,copy)NSString *score;
-(void)study;
@end
