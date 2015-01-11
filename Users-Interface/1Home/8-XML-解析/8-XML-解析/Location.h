//
//  Location.h
//  第八章-同步Get请求下载
//
//  Created by 闫潇 on 15/1/9.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject
@property (nonatomic,copy) NSString * timezone;
@property (nonatomic,copy) NSString * timezone_offset_gmt;
@property (nonatomic,copy) NSString * latitude;
@property (nonatomic,copy) NSString * longitude;
@end
