//
//  ViewController.h
//  8-XML-解析
//
//  Created by 闫潇 on 15/1/9.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,NSURLConnectionDataDelegate,UITableViewDelegate>
@property (nonatomic,strong) UITableView * tableV;//
@property (nonatomic,strong) NSMutableArray * list;//数据源
@property (nonatomic,strong) NSMutableData * data;//已缓存数据

@end

