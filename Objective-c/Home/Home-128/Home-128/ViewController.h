//
//  ViewController.h
//  Home-128
//
//  Created by 闫潇 on 14/12/8.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceManager.h"
@interface ViewController : NSObject<SourceManagerDelegate>
//1,当点击按钮时，使用sourceManage对象请求url
//2,如果请求成功，把url显示在label上，并且用player对象播放该url
//3，如果请求失败，在label上显示失败原因
//4，当播放完成时，在label上显示播放完成
@end
