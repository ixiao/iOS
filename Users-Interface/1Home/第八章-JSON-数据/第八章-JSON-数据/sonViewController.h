//
//  sonViewController.h
//  第八章-JSON-数据
//
//  Created by 闫潇 on 15/1/8.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sonViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)UITableView*tab;
@property(strong,nonatomic)NSMutableArray*array;

@end
