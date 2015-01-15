//
//  ViewController.m
//  第二章-CoreData-Story
//
//  Created by 闫潇 on 15/1/15.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtAge;
@property (strong, nonatomic) IBOutlet UITextField *txtId;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;//托管对象上下文(类似于数据库的缓存区)
@property (nonatomic,strong) NSArray * students;//查询出来的数组
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取应用程序中的托管对象上下文
    //1.获取应用程序对象
    UIApplication *app=[UIApplication sharedApplication];
    //2.获取应用程序的委托
    id appDeleagte=app.delegate;
    //3.获取应用程序中的托管对象上下文
     self.managedObjectContext=[appDeleagte managedObjectContext];
    [self getDocPath];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 注册
- (IBAction)btnRegister:(id)sender {
    //通过实体描述类创建数据模型（托管对象）放入托管对象上下文中
    Student * stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
    //给数据模型（托管对象 属性绑定界面数据）
    static int i =0;
    stu.id = [NSNumber numberWithInt:i];
    stu.name = self.txtName.text;
    stu.age = [NSNumber numberWithInt:[self.txtAge.text intValue]];
    
    // 通过托管对象上下文保存数据模型（托管对象）
    __autoreleasing  NSError * error = nil;
    [self.managedObjectContext save:&error];
    //判断是否保存成功
    if (error)
    {
        [self myAlert:@"托管对象保存失败"];
    }
    else
    {
        [self myAlert:@"托管对象保存成功"];
    }
}
#pragma mark 查询
- (IBAction)btnSearch:(id)sender {
    //1.创建抓取请求
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    //从界面获取条件
    NSNumber * id = [NSNumber numberWithInt:[self.txtId.text intValue]];
    NSLog(@"id%@",id);
    
    //2、创建谓词(查询条件)
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"id=%@",id];
    //2.1把谓词放入抓取请求对象中
    [request setPredicate:predicate];
    
    //3.创建排序规则
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"id" ascending:YES];
    //3.1把拍训规则放入抓去请求对象中
    [request setSortDescriptors:@[sortDescriptor]];
    
    // 4 执行抓取
    __autoreleasing NSError * error = nil;
    self.students = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (error)
    {
        [self myAlert:@"查询失败!"];
    }
    else
    {
        [self myAlert:@"查询成功，请看控制台！"];
        NSLog(@"查询结果%@",self.students);
    }
}
//首先删除数据库文件，下面代码用于解决数据模型改变跟最早数据库表不匹配报错问题，问题一旦解决注释下面一行代码
//[[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];

#pragma mark 封装UIAlertView
- (void)myAlert:(NSString *)errorMsg {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"信息" message:errorMsg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}
#pragma mark 获取应用沙盒的documents 目录路径
-(NSString *)getDocPath
{
    NSArray * docPaths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * docPath = docPaths[0];
    
//    NSLog(@"%@",docPath);
    return docPath;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtId resignFirstResponder];
    [self.txtAge resignFirstResponder];
    [self.txtName resignFirstResponder];
}
//core data自动生成的表和属性
//Z_PRIMARYKEY
//1.Z_ENT --实体ID
//2.Z_NAME
//3.Z_SUPER
//4.Z_MAX --实体所用到的最大ID（关键所在）
//自定义表中的属性
//1.Z_PK -- 对象的唯一ID
//2.Z_ENT -- 实体ID 跟Z_PRIMARYKEY表中的值一样
//3.Z_OPT -- 编辑次数
//重点自然是Z_MAX和Z_PK
//Z_PK是一个对象的"唯一"ID，正常的添加过程大概是这样的：
//NEW_PK = ++Z_MAX;
//
//insert();
//不管表中记录是否已经删除，Z_MAX都只会+1，不会变小，以此保证ID的唯一性。
// 
//默认数据库里没有更改Z_PRIMARYKEY表中的值，Z_MAX都是默认的0，添加不上是因为Z_MAX的值不符合规则。

@end
