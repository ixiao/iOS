//
//  ViewController.m
//  Block  PassValue
//
//  Created by Fan Tengfei on 15/1/4.
//  Copyright (c) 2015年 Fan Tengfei. All rights reserved.
//

#import "modalViewController.h"

@interface modalViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textName;

@end

@implementation modalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//初始化代码块方法
-(void)initWithBlock:(MyBlock)myBlock
{
    self.myBlock=myBlock;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.textName.text=self.name;
}


- (IBAction)modifyName:(UIButton *)sender {
    //获取修改后的姓名
    NSString *name=self.textName.text;
    //回调跟试图控制器的代码块
    self.myBlock(name);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
