//
//  Student.h
//  Home-WeiTuo
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "Person.h"
#import "WorkingPartner.h"
@interface Student : Person<WorkingPartner>
@property (nonatomic,strong) NSString * name ;
@property (nonatomic,assign) NSInteger age;

@end
