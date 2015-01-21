//
//  NewViewController.h
//  8-作业
//
//  Created by ibokan on 15/1/8.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *list;

@end
