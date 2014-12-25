//
//  ViewController.h
//  Home-控件、03
//
//  Created by 闫潇 on 14/12/23.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UIActionSheetDelegate,UIAlertViewDelegate>
@property (nonatomic,strong) UILabel * birthdayLabel;
@property (nonatomic,strong) UILabel * citiesLabel;
@property (nonatomic,strong) NSArray * provinces;//表盘中显示的省份数组
@property (nonatomic,strong) NSArray * cities;//表盘中显示的城市数组
@property (nonatomic,strong) UIDatePicker * datepicker;
@property (nonatomic,strong) UIPickerView * pickView;
@property (nonatomic,strong) UIButton * birthdayBt;
@property (nonatomic,strong) UIButton * citiesBt;
@property (nonatomic,strong) UIButton * moreBt;
@property (nonatomic,strong) UIButton * okBt;
@property (nonatomic,strong) UIActionSheet * actionSheet;//操作表

@end

