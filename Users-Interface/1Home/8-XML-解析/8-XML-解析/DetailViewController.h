//
//  DetailViewController.h
//  8-XML-解析
//
//  Created by 闫潇 on 15/1/11.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Division.h"
@interface DetailViewController : UIViewController
@property (nonatomic,strong) Division * division;
@property (nonatomic,strong) UILabel * timezone;
@property (nonatomic,strong) UILabel * timezone_offset_gmt;
@property (nonatomic,strong) UILabel * latitude;
@property (nonatomic,strong) UILabel * longitude;
@end
