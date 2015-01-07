//
//  ViewController.m
//  第七章-代码块传值
//
//  Created by 闫潇 on 15/1/4.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "DeatilViewController.h"

@interface DeatilViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textName;

@end

@implementation DeatilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 点击确定按钮回调根视图控制器的代码块

- (IBAction)moreName:(UIButton *)sender {
    //回调修改后的姓名
    NSString * name =self.textName.text;
    //回调根视图控制器的代码块
//    self.myBlock;
}
#pragma mark 视图将要出现时文本框最后那个显示需要修改的数据
-(void)viewWillAppear:(BOOL)animated
{
    
}
-(instancetype)init
#pragma mark 遍历初始化函数
-(instancetype)initWithBlock:(MyBlock)myBlock
{
    self = [super init];
    if (self) {
        self.myBlock = myBlock;//给当前属性代码块赋值
    }
    return self;
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
