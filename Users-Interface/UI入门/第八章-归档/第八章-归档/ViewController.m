//
//  ViewController.m
//  第八章-归档
//
//  Created by 闫潇 on 15/1/6.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 归档
- (IBAction)guiDang:(UIButton *)sender {
    //进行归档步骤：
    //首先创建要归档的类的对象，并给属性赋值
    Student * stu = [Student new];
    stu.name=@"xiao";
    stu.age = 20;
    stu.adress=@"帝都";
    //实例化一个NSMutableData对象，用来将对象归档其中
    NSMutableData * data = [NSMutableData new];
    //符合NSCoding协议的对象创建归档时，需要使用一个NSKeyedArchiver实例来做这件事情，使用其initForWritingWithMutableData:实例方法创建NSKeyedArchiver实例
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //调用NSKeyedArchiver的实例方法encodeObject: forKey:进行归档
    [archiver encodeObject:stu forKey:@"stu"];
    //调用NSKeyedArchiver的实例方法finishEncoding结束归档
    [archiver finishEncoding];
    //调用NSMutableData对象的实例方法writeToFile: atomically: 将归档后对象写入文件
    [data writeToFile:[self getFilePath:@"student.txt"] atomically:YES];
    //将对象归档到文件中之后，可以从文件中取消归档重新组成对象同样需要借助于一个NSKeyedUnarchiver的实例来完成
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"归档成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
}
#pragma mark 解档
- (IBAction)jieDang:(id)sender {
    //取消归档步骤：
    //首先使用NSFileManager的实例方法fileExistsAtPath:判断文件是否存在
    //如果存在，调用NSData的实例方法initWithContentsOfFile: 实例化一个NSData对象，用来将对象解档
    // 使用NSKeyedUnarchiver的实例方法initForReadingWithData:创建NSKeyedUnarchiver对象
    //使用NSKeyedUnarchiver对象的decodeObjectForKey:实例方法解档出相应对象
}
-(void)unArchiver:(id)sender
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:])
    {
        NSData = [NSData alloc]init
        NSKeyedArchiver * unarchiver = [NSKeyedArchiver alloc]
        
        Student * stu = (Student *)[unarchiver ]
    }
    else
    {
        NSLog(@"文件不存在，解个毛线");
    }

}
#pragma mark 获取文件绝对路径
-(NSString *)getFilePath:(NSString *)fileName
{
    //获取documents目录数组
    NSArray * docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取document目录
    NSString * docpath = docPaths[0];
    //组合文件完整路径 返回
    NSString * filePath = [docpath stringByAppendingPathComponent:fileName];
    
    NSLog(@"filePath:%@",filePath);
    return filePath;
}
@end
