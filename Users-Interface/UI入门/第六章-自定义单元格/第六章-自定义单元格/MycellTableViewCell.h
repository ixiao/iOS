//
//  MycellTableViewCell.h
//  第六章-自定义单元格
//
//  Created by 闫潇 on 14/12/31.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MycellTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *niName;

@end
