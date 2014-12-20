//
//  ViewController.m
//  3-常用控件
//
//  Created by ibokan on 14/12/19.
//  Copyright (c) 2014年 @慕辰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *lable;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmented;
@property (strong, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *rightSwitch;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //指定textField的委托
    self.textField.delegate = self;
    //指定textView的委托
    self.textView.delegate = self;
}
#pragma mark 收起键盘
- (IBAction)closeKeyboard:(id)sender
{
    [self.textField resignFirstResponder];
}
#pragma mark 开关切换
- (IBAction)switchChose:(UISwitch *)sender
{
    //获取选中的开关的状态
    BOOL isOn = sender.isOn;
    //分别设置左右两个开关的状态为选中的开关状态
    [self.leftSwitch setOn:isOn animated:YES];
    [self.rightSwitch setOn:isOn animated:YES];
}

#pragma mark 分段按钮切换
- (IBAction)segment:(UISegmentedControl *)sender {
    
    
}
#pragma mark 回调点击文本框软键盘return键的委托方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //收起键盘,textField放弃第一响应者s
    [textField resignFirstResponder];
    //取出textField上文本显示在label上
    self.lable.text = textField.text;
    return YES;
}
#pragma mark 回调文本框完成输入的委托方法
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //取出textField上文本显示在label上
    self.lable.text = textField.text;
}
#pragma mark 触摸屏幕空白位置回调方法
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark textView回调的委托方法
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //判断用户选择了回车换行还是回车返回
    if (self.segmented.selectedSegmentIndex == 1)
    {
        //当用户录入回车收起键盘
        if ([@"\n" isEqualToString:text])
        {
            //收起键盘,textView放弃第一响应者
            [textView resignFirstResponder];
            return NO;
        }
    }
    return YES;
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
