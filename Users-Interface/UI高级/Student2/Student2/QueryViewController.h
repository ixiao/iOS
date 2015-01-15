//
//  QueryViewController.h
//  Student2
//
//  Created by 葛峰茂华 on 14-5-13.
//  Copyright (c) 2014年 pinzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface QueryViewController : UIViewController<UITextFieldDelegate>
{
    sqlite3 *db;
    
    UITextField *name;
    UITextField *age;
    UITextField *address;
    UITextField *phone;
    UITextField *score;
    
    UILabel *lable1;
    UILabel *lable2;
    UILabel *lable3;
    UILabel *lable4;
    UILabel *lable5;
    
    UILabel *status;
    
    NSString *databasePath;
}
@property (retain,nonatomic)IBOutlet UITextField *name;
@property (retain,nonatomic)IBOutlet UITextField *age;
@property (retain,nonatomic)IBOutlet UITextField *address;
@property (retain,nonatomic)IBOutlet UITextField *phone;
@property (retain,nonatomic)IBOutlet UITextField *score;
@property (retain,nonatomic)IBOutlet UILabel *status;

@end
