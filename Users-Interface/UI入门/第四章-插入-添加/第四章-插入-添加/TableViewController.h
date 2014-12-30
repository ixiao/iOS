//
//  TableViewController.h
//  第四章-插入-添加
//
//  Created by 闫潇 on 14/12/30.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray *list;//数据源

-(void)moreName:(NSDictionary *)dic;
@end
