//
//  ViewController.m
//  第一章-数据库-SQlite3
//
//  Created by 闫潇 on 15/1/14.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "Student.h"
#define FILENAME @"MySQLite3.sqlite"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtName;//姓名文本
@property (strong, nonatomic) IBOutlet UITextField *txtAge;//年龄文本
@property (strong, nonatomic) IBOutlet UITextField *txtId;//ID文本
@property (strong, nonatomic) NSMutableArray * students;//学生

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //去创建Sqlite3数据库
    //准备创建表的sql语句
    
    //初始化学生数组
    self.students = [NSMutableArray new];
    [self create_sqlite3_table];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 创建SQLite3表
- (void)create_sqlite3_table {
    //打开SQLite3数据库
    sqlite3 *db = [self sqlite3_open_database];
    //准备创建表的sql语句
    const char *sql = "CREATE TABLE IF NOT EXISTS student(id integer primary key,name varchar2(255),age int)";
    //声明保存错误信息的c类型字符串
    char *errMsg = NULL;
    //执行sql语句创建表
    int result = sqlite3_exec(db, sql, NULL, NULL, &errMsg);
    //创建表出错
    if (result != SQLITE_OK) {
        [self myAlert:[NSString stringWithFormat:@"创建表出错：%s",errMsg]];
    } else {
        [self myAlert:@"创建表成功！"];
    }
    //无论出错与否都要关闭数据库
    sqlite3_close(db);
}

#pragma mark 注册方法
- (IBAction)btnRegister:(id)sender {
    
    //1、打开数据库
    sqlite3 *db = [self sqlite3_open_database];
    //2、建立预编译语句对象并编译
    char *sql = "INSERT INTO student(name,age) VALUES(?,?)";//？为占位符，代表此处将来用变量值替换
    //2.1、准备预编译语句对象
    sqlite3_stmt *stmt = NULL;
    //2.2、预编译sql语句
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    //2.3、预编译成功，绑定值
    if (result == SQLITE_OK) {
        //绑定界面数据到预编译sql语句中
        sqlite3_bind_text(stmt, 1, [self.txtName.text UTF8String], -1, NULL);
        sqlite3_bind_int(stmt, 2, [self.txtAge.text intValue]);
        //3、执行预编译语句对象，4、使用结果
        result = sqlite3_step(stmt);
        if (result == SQLITE_DONE) {
            [self myAlert:@"插入数据成功！"];
        } else {
            [self myAlert:@"插入数据失败！"];
        }
    }
    //5、销毁预编译语句对象，关闭数据库
    sqlite3_finalize(stmt);
    sqlite3_close(db);
}

#pragma mark 查询方法
- (IBAction)btnSearch:(id)sender {
    //1、打开数据库
    sqlite3 *db = [self sqlite3_open_database];
    //2、准备预编译语句并编译
    char *sql = "SELECT * FROM student WHERE id = ?";
    //2.1声明预编译语句对象
    sqlite3_stmt *stmt = NULL;
    //2.2预编译sql语句
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    //2.3预编译成功，绑定值
    if (result == SQLITE_OK) {
        //获取文本框ID值绑定到预编译语句中
        sqlite3_bind_int(stmt, 1, [self.txtId.text intValue]);
        [self myAlert:@"查询成功！请查看控制台！"];
        [self.students removeAllObjects];
        //3、执行预编译语句
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //4、处理结果，取出结果行中每一列赋值到模型对象的属性当中，把模型对象放入数组中
            Student *stu = [Student new];
            stu.id = sqlite3_column_int(stmt, 0);
            stu.name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            stu.age = sqlite3_column_int(stmt, 2);
            [self.students addObject:stu];
        }
        NSLog(@"%@",self.students);
    } else {
        [self myAlert:@"查询失败！"];
    }
    //5、销毁预编译语句对象，关闭数据库
    sqlite3_finalize(stmt);
    sqlite3_close(db);
}

#pragma mark 打开SQLite3数据库
- (sqlite3 *)sqlite3_open_database {
    //创建sqlite3类型的指针
    sqlite3 *db = NULL;
    //打开sqlite3数据库，如果有则打开，没有则创建
    NSString *filePath = [self getFilePath];
    int result = sqlite3_open([filePath UTF8String], &db);
    //数据库打开失败
    if (result != SQLITE_OK) {
        //数据库打开失败，关闭数据库
        NSString *errorMsg = NULL;//捕获数据库错误信息
        sqlite3_close(db);
        NSAssert(0, @"数据库打开失败！",errorMsg);//断言调试程序，当第一个参数为假时，控制台显示自定义的错误信息，捕获数据库操作错误信息
        [self myAlert:@"数据库打开失败！"];
    }
    return db;
}


#pragma mark 获取数据库文件路径
- (NSString *)getFilePath {
    //需要返回的文件路径
    NSString *filePath = nil;
    //获取应用程序沙盒中的documents目录
    NSArray *docPathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = docPathArray[0];
    NSLog(@"docPath:%@",docPath);
    filePath = [docPath stringByAppendingPathComponent:FILENAME];
    return filePath;
}

#pragma mark 封装UIAlertView
- (void)myAlert:(NSString *)errorMsg {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"信息" message:errorMsg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtName resignFirstResponder];
    [self.txtAge resignFirstResponder];
    [self.txtId resignFirstResponder];
}
@end
