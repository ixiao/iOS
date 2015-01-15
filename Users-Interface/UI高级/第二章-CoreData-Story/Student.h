//
//  Student.h
//  第二章-CoreData-Story
//
//  Created by 闫潇 on 15/1/15.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;

@end
