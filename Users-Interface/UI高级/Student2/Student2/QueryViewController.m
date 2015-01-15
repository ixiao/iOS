//
//  QueryViewController.m
//  Student2
//
//  Created by 葛峰茂华 on 14-5-13.
//  Copyright (c) 2014年 pinzhi. All rights reserved.
//

#import "QueryViewController.h"
#define TABLENAME  @"CONTACTS"
@interface QueryViewController ()

@end

@implementation QueryViewController
@synthesize name;
@synthesize age;
@synthesize address;
@synthesize phone;
@synthesize score;
@synthesize status;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    lable1 = [[[UILabel alloc]initWithFrame:CGRectMake(62, 137, 42, 21)]autorelease];
    lable1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //lable1.textAlignment = UITextAlignmentCenter;
    lable1.text =@"姓名";
    [self.view addSubview:lable1];
    name = [[[UITextField alloc]init]autorelease];
    name.frame = CGRectMake(112, 132, 157, 30);
    name.borderStyle = UITextBorderStyleRoundedRect;
    name.delegate = self;
    name.keyboardType = UIKeyboardTypeNamePhonePad;
    name.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:name];
//    [name becomeFirstResponder];
//    [name resignFirstResponder];
//    
    
    lable2 = [[[UILabel alloc]initWithFrame:CGRectMake(62, 175, 42, 21)]autorelease];
    lable2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //lable2.textAlignment = UITextAlignmentCenter;
    lable2.text =@"年龄";
    [self.view addSubview:lable2];
    age = [[[UITextField alloc]init]autorelease];
    age.frame = CGRectMake(112, 170, 157, 30);
    age.borderStyle = UITextBorderStyleRoundedRect;
    age.keyboardType = UIKeyboardTypeNumberPad;
    age.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:age];
//    [age becomeFirstResponder];
//    [age resignFirstResponder];
    
    lable3 = [[[UILabel alloc]initWithFrame:CGRectMake(62, 213, 42, 21)]autorelease];
    lable3.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //lable3.textAlignment = UITextAlignmentCenter;
    lable3.text =@"地址";
    [self.view addSubview:lable3];
    address = [[[UITextField alloc]init]autorelease];
    address.frame = CGRectMake(112, 208, 157, 30);
    address.borderStyle = UITextBorderStyleRoundedRect;
    address.delegate = self;
    address.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:address];
//    [address becomeFirstResponder];
//    [address resignFirstResponder];
    
    lable4 = [[[UILabel alloc]initWithFrame:CGRectMake(62, 251, 42, 21)]autorelease];
    lable4.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //lable4.textAlignment = UITextAlignmentCenter;
    lable4.text =@"电话";
    [self.view addSubview:lable4];
    phone = [[[UITextField alloc]init]autorelease];
    phone.frame = CGRectMake(112, 246, 157, 30);
    phone.borderStyle = UITextBorderStyleRoundedRect;
    phone.keyboardType = UIKeyboardTypePhonePad;
    phone.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:phone];
//    [phone becomeFirstResponder];
//    [phone resignFirstResponder];
    
    lable5 = [[[UILabel alloc]initWithFrame:CGRectMake(62, 289, 42, 21)]autorelease];
    lable5.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //lable5.textAlignment = UITextAlignmentCenter;
    lable5.text =@"成绩";
    [self.view addSubview:lable5];
    score = [[[UITextField alloc]init]autorelease];
    score.frame = CGRectMake(112, 284, 157, 30);
    score.borderStyle = UITextBorderStyleRoundedRect;
    score.keyboardType = UIKeyboardTypePhonePad;
    score.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:score];
//    [score becomeFirstResponder];
//    [score resignFirstResponder];
    
    
    NSString *string1 = [NSString stringWithFormat:@"状态:"];
    status = [[[UILabel alloc]initWithFrame:CGRectMake(62, 340, 170, 24)]autorelease];
    status.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //status.textAlignment = UITextAlignmentCenter;
    status.text =string1;
    [self.view addSubview:status];
    
    NSString *documents;
    NSArray *paths;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documents = [paths objectAtIndex:0];
    databasePath = [[NSString alloc] initWithString: [documents stringByAppendingPathComponent: @"db"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath:databasePath] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &db)==SQLITE_OK)
        {
            char *err;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT,AGE TEXT, ADDRESS TEXT,PHONE TEXT,SCORE TEXT)";
            if (sqlite3_exec(db, sql_stmt, NULL, NULL, &err)!=SQLITE_OK) {
                NSString *string2 = [NSString stringWithFormat:@"创建表失败\n"];
                 NSString *string0 = [string1 stringByAppendingString:string2];
              status.text = string0;
                
            }
        }
        else
        {
            NSString *string7 = [NSString stringWithFormat:@"创建/打开数据库失败"];
            NSString *string0 = [string1 stringByAppendingString:string7];
            status.text = string0;

        }
    }

     UIButton *button1 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
      button1.titleLabel.font=[UIFont boldSystemFontOfSize:15];
      button1.frame = CGRectMake(145, 390, 30, 30);
    
    [button1 addTarget:self
                  action:@selector(button1Pressed:)
        forControlEvents:UIControlEventTouchUpInside];
    
      [button1 setTitle:@"保存" forState:UIControlStateNormal];
      [self.view addSubview:button1];
    
    UIButton *button2 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    button2.frame = CGRectMake(145, 420, 30, 30);
    
    [button2 addTarget:self
                action:@selector(button2Pressed:)
      forControlEvents:UIControlEventTouchUpInside];

    [button2 setTitle:@"删除" forState:UIControlStateNormal];
    [self.view addSubview:button2];

    UIButton *button3 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    button3.frame = CGRectMake(145, 450, 30, 30);
    
    [button3 addTarget:self
                action:@selector(button3Pressed:)
      forControlEvents:UIControlEventTouchUpInside];

    [button3 setTitle:@"修改" forState:UIControlStateNormal];
    [self.view addSubview:button3];
    
    UIButton *button4 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    button4.frame = CGRectMake(145, 480, 30, 30);
    
    [button4 addTarget:self
                action:@selector(button4Pressed:)
      forControlEvents:UIControlEventTouchUpInside];
    
    [button4 setTitle:@"查询" forState:UIControlStateNormal];
    [self.view addSubview:button4];
   


//    NSString *string2 = [NSString stringWithFormat:@"123"];
//    NSString *string3 = [string1 stringByAppendingString:string2];
//    status.text = string3;
    
    [super viewDidLoad];
 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)button1Pressed :(id)sender {
   // UIButton *button1=sender;
   NSString *string1 = [NSString stringWithFormat:@"状态:"];
    sqlite3_stmt *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &db)==SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO CONTACTS (name,age,address,phone,score) VALUES(\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",name.text,age.text,address.text,phone.text,score.text];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(db, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            NSString *string3 = [NSString stringWithFormat:@"已存储到数据库"];
            NSString *string0 = [string1 stringByAppendingString:string3];
            status.text = string0;
            name.text = @"";
            age.text = @"";
            address.text = @"";
            phone.text = @"";
            score.text = @"";
        }
        else
        {
            NSString *string8 = [NSString stringWithFormat:@"保存失败"];
            NSString *string0 = [string1 stringByAppendingString:string8];
            status.text = string0;

        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
}
    
- (void)button2Pressed :(id)sender {
     NSString *string1 = [NSString stringWithFormat:@"状态:"];
    sqlite3_stmt *statement;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &db) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE from contacts where name=\"%@\"" ,name.text];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(db, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            NSString *string4 = [NSString stringWithFormat:@"已删除数据库"];
            NSString *string0 = [string1 stringByAppendingString:string4];
            status.text = string0;
            name.text = @"";
            age.text = @"";
            address.text = @"";
            phone.text = @"";
            score.text = @"";
        }
        else
        {
            NSString *string9 = [NSString stringWithFormat:@"删除失败"];
            NSString *string0 = [string1 stringByAppendingString:string9];
            status.text = string0;

        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    

  }
- (void)button3Pressed :(id)sender {
    NSString *string1 = [NSString stringWithFormat:@"状态:"];
    sqlite3_stmt *statement;
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &db) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"update contacts set age=\"%@\" ,address=\"%@\" ,phone=\"%@\" , score=\"%@\" where name=\"%@\"" ,age.text,address.text,phone.text,score.text,name.text];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(db, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            NSString *string5 = [NSString stringWithFormat:@"已修改数据库"];
            NSString *string0 = [string1 stringByAppendingString:string5];
            status.text = string0;
            name.text = @"";
            age.text = @"";
            address.text = @"";
            phone.text = @"";
            score.text = @"";
        }
        else
        {
            NSString *string10 = [NSString stringWithFormat:@"修改失败"];
            NSString *string0 = [string1 stringByAppendingString:string10];
            status.text = string0;
            
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    
}
- (void)button4Pressed :(id)sender {
    NSString *string1 = [NSString stringWithFormat:@"状态:"];
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &db) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT age,address,phone,score from contacts where name=\"%@\"",name.text];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(db, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *ageField = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                age.text = ageField;
                
                NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                address.text = addressField;
                
                NSString *phoneField = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 2 )];
                phone.text = phoneField;
                
                NSString *scoreField = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 3 )];
                score.text = scoreField;
                
                NSString *string6 = [NSString stringWithFormat:@"已查到结果"];
                NSString *string0 = [string1 stringByAppendingString:string6];
                status.text = string0;

                [ageField release];
                [addressField release];
                [phoneField release];
                [scoreField release];
                
            }
            else {
                NSString *string11 = [NSString stringWithFormat:@"未查到结果"];
                NSString *string0 = [string1 stringByAppendingString:string11];
                status.text = string0;

                age.text=@"";
                address.text = @"";
                phone.text = @"";
                score.text =@"";
            }
            sqlite3_finalize(statement);
        }
        
        sqlite3_close(db);
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 触摸背景，关闭键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    UIView *view = (UIView *)[touch view];
    if (view == self.view) {
        [name resignFirstResponder];
        [age resignFirstResponder];
        [address resignFirstResponder];
        [phone resignFirstResponder];
        [score resignFirstResponder];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [name resignFirstResponder];
    [address resignFirstResponder];
    return YES;
}
@end
