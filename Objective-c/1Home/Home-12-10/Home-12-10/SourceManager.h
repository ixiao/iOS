//
//  SourceManager.h
//  OC-ywlj3
//
//  Created by 徐赢 on 14-9-11.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SMR)(NSString * string);
typedef void(^SME)(NSError * error);

@interface SourceManager : NSObject
//request String methon
-(void)qingqiuString;

//方法的参数是代码块，将来系统会回调参数中的代码块
-(void)setDidReceiveStringBlock:(SMR)aBlock;
-(void)setDidReceiveErrorBlock:(SME)aBlock;



@end

