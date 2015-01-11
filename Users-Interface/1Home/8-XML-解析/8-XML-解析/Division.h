//
//  Division.h
//  第八章-同步Get请求下载
//
//  Created by 闫潇 on 15/1/9.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
@interface Division : NSObject
@property (copy,nonatomic) NSString * id;
@property (copy,nonatomic) NSString * name;
@property (strong,nonatomic) Location * location;
@end
