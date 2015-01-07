//
//  MyCell.m
//  第六章-自定义单元格-code
//
//  Created by 闫潇 on 14/12/31.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "MyCell.h"

#import "Student.h"
@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark 此方法在初始化单元格时调用
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super init];
    if (self) {
        //自定义单元格
        self.myimageView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 4, 141, 111)];
        
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(162, 33, 51, 21)];
        self.nameLabel.text = @"姓名:";
        UILabel * name = [[UILabel alloc]initWithFrame:CGRectMake(162, 63, 51, 21)];
        
        self.niNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(221, 34, 138, 21)];
        UILabel * niNime = [[UILabel alloc]initWithFrame:CGRectMake(221, 64, 138, 21)];
        self.niNameLabel.text = @"昵称:";
        //添加到表视图的内容视图上
        [self.contentView addSubview:self.myimageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.niNameLabel];
        [self.contentView addSubview:name];
        [self.contentView addSubview:niNime];
    }
    return self;
}



@end
