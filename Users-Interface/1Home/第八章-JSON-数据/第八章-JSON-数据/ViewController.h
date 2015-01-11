//
//  ViewController.h
//  第八章-JSON-数据
//
//  Created by 闫潇 on 15/1/8.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sonViewController.h"
@interface ViewController : UIViewController<UITableViewDataSource,NSURLConnectionDataDelegate,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray * list;//数据
@property (nonatomic,strong) UITableView * tableView;//表视图
@property (nonatomic,strong) NSMutableData * myData;//返回的数据
@property (nonatomic,strong) sonViewController * son;
@end

