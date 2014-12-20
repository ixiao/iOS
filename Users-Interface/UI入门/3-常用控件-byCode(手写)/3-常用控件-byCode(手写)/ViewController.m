//
//  ViewController.m
//  3-常用控件-byCode(手写)
//
//  Created by ibokan on 14/12/19.
//  Copyright (c) 2014年 @慕辰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UISwitch *leftSwitch;
@property (strong, nonatomic) UISwitch *rightSwitch;
@property (strong, nonatomic) UISegmentedControl *segmented;

@end

@implementation ViewController
//视图加载成功后调用
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建界面控件
    [self onCreate];
}
#pragma mark 创建界面控件
- (void)onCreate{
    //创建label
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(103, 30, 165, 21)];
    self.label.text = @"Hello World!";
    self.label.font = [UIFont systemFontOfSize:18];
    self.label.textColor = [UIColor redColor];//文本的颜色
    //添加到画布上
    [self.view addSubview:self.label];

    //创建textField
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(63, 59, 174, 30)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"请输入姓名:";
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.autocorrectionType = UITextAutocorrectionTypeYes;
    self.textField.textAlignment = NSTextAlignmentRight;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.textField.keyboardType = UIKeyboardTypeURL;
    self.textField.keyboardAppearance = UIKeyboardAppearanceAlert;
    self.textField.returnKeyType = UIReturnKeyDone;
    //指定委托
    self.textField.delegate = self;
    //添加到画布上
    [self.view addSubview:self.textField];
    
    //创建button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(249, 40, 60, 30);
    [button setTitle:@"收起键盘" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventAllTouchEvents];
    
    //添加到画布上
    [self.view addSubview:button];
    
    //创建textView
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(49, 111, 203, 151)];
    self.textView.layer.borderColor = [UIColor greenColor].CGColor;
    self.textView.layer.borderWidth = 0.5f;
    //指定委托
    self.textView.delegate = self;
    //添加到画布上
    [self.view addSubview:self.textView];
    
    //创建switch
    self.leftSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(100, 308, 51, 31)];
    [self.leftSwitch setOn:YES];
    self.rightSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(188, 308, 51, 31)];
    [self.rightSwitch setOn:YES];
    [self.view addSubview:self.leftSwitch];
    [self.view addSubview:self.rightSwitch];
    [self.leftSwitch addTarget:self action:@selector(switchChoose:) forControlEvents:UIControlEventAllEvents];
    [self.rightSwitch addTarget:self action:@selector(switchChoose:) forControlEvents:UIControlEventAllEvents];
    
    //创建segmentedControl;
    NSArray *segmentedItems = @[@"回车换行",@"回车返回"];
    self.segmented = [[UISegmentedControl alloc]initWithItems:segmentedItems];
    self.segmented.frame = CGRectMake(100, 379, 123, 29);
    [self.view addSubview:self.segmented];
    
    
}
//收起键盘按钮触发方法
- (void)tapButton:(UIButton *)sender
{
    [self.textField resignFirstResponder];
    [self.textView resignFirstResponder];
}
#pragma mark 回调点击文本框软键盘return键的委托方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    self.label.text = textField.text;
    return YES;
}
//设置开关同步
- (void)switchChoose:(UISwitch *)sender
{
    BOOL isOn = sender.isOn;
    [self.leftSwitch setOn:isOn animated:YES];
    [self.rightSwitch setOn:isOn animated:YES];
}
//点击屏幕空白处收回键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark textView回调的委托方法
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (self.segmented.selectedSegmentIndex == 1) {
        if ([@"\n" isEqualToString:text]) {
            [textView resignFirstResponder];
            return YES;
        }
    }return NO;
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
