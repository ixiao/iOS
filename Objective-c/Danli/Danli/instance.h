//
//  instance.h
//  OC-10-单例
//
//  Created by ibokan on 14-12-4.
//  Copyright (c) 2014年 少帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface instance : NSObject<NSCopying,NSMutableCopying>
//单例方法
+(instancetype)sharedSingleton;

@end
