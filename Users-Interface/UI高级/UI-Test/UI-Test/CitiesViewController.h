//
//  CitiesViewController.h
//  UI-Test
//
//  Created by 闫潇 on 15/1/19.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitiesViewController : UITableViewController
@property (nonatomic,strong) NSArray * cities;//城市数组
@property (nonatomic,strong) NSDictionary * provinceDic;//城市字典
@end
