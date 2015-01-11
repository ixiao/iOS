//
//  ViewController.m
//  第八章-XML-解析
//
//  Created by 闫潇 on 15/1/9.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "Users.h"
@interface ViewController ()
@property (nonatomic,strong) NSMutableArray * usersarr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化
    NSMutableArray * mUsers = [NSMutableArray new];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma 使用GdataXML解析XML文档
- (IBAction)GdataXML:(UIButton *)sender {
    //读取文件到缓冲区
    NSString * file = [[NSBundle mainBundle]pathForResource:@"users" ofType:@"xml"];
    NSData * xmlData = [NSData dataWithContentsOfFile:file];
    //通过XML缓冲区创建GDataXML解析器
    GDataXMLDocument * xmlDocument = [[GDataXMLDocument alloc]initWithData:xmlData options:0 error:nil];
    //获取根节点
    GDataXMLElement * rootElenent = [xmlDocument rootElement];
    
    //创建user
    Users *  = [Users new];
    //获取根节点下的子节点
    NSArray *users = [rootElenent elementsForName:@"User"];
    
    
    for (GDataXMLElement  * user in users) {
        //获取User节点的id属性值
        NSString * idStr = [[user attributeForName:@"id"]stringValue];
        NSLog(@"id:%@",idStr);
        
        //获取Users节点的name节点
         GDataXMLElement * nameElement = [user elementsForName:@"name"][0];
        NSString * name = [nameElement stringValue];
        NSLog(@"name:%@",name);
        
        //获取User节点的age节点
        GDataXMLElement * ageElement = [user elementsForName:@"age"][0];
        NSString * age = [ageElement stringValue];
        NSLog(@"age:%@",age);
    }
}
#pragma mark 使用iOS自带解析

- (IBAction)XMLPass:(UIButton *)sender {
}

@end
