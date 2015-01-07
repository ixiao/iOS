//
//  ViewController.m
//  第七章-代码块
//
//  Created by 闫潇 on 15/1/4.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "DeatilViewController.h"

@interface DeatilViewController ()
@property (nonatomic,strong) UITextField * txtname;//文本框对象
@end

@implementation DeatilViewController
//遍历初始化函数
-(id)initWithBlock:(MyBlock)myBlock
{
    self = [super init];
    if (self)
    {
        self.myBlock=myBlock;//获取对象传过来的代码块对象
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建文本框和按钮
    self.txtname = [[UITextField alloc]initWithFrame:CGRectMake(100, 120, 150, 30)];
    self.txtname.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:self.txtname];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(150, 140, 50, 50);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doSomething:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)doSomething:(UIButton *)sender
{
    //1.获取修改后的数据
    NSString * name = self.txtname.text;
    //2.回调代码块
    if (self.myBlock)
    {
        self.myBlock(name);
    }
    //3.关闭模态视图
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
