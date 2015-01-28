//
//  ViewController.m
//  邮箱-浏览器-电话-短信
//
//  Created by 闫潇 on 15/1/28.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txtURL;//网址、电话、短信

@property (strong, nonatomic) IBOutlet UITextField *txtTo;//邮件收件人
@property (strong, nonatomic) IBOutlet UITextField *txtSubject;//有奖主题
@property (strong, nonatomic) IBOutlet UITextField *txtBody;//邮件内容


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.txtURL.delegate=self;
    self.txtTo.delegate=self;
    self.txtSubject.delegate=self;
    self.txtBody.delegate=self;
    
}
#pragma mark
//打开浏览器
- (IBAction)openSafari:(id)sender {
    NSString *strURL = self.txtURL.text;
    NSURL *url = [NSURL URLWithString:strURL];
    [[UIApplication sharedApplication]openURL:url];
}
#pragma mark
//打电话
- (IBAction)openCall:(id)sender {
    NSString *strURL = self.txtURL.text;
    strURL = [NSString stringWithFormat:@"tel://%@",strURL];
    NSURL *url = [NSURL URLWithString:strURL];
    [[UIApplication sharedApplication]openURL:url];
}
#pragma mark
//发短信
- (IBAction)openMessage:(id)sender {
    NSString *strURL = self.txtURL.text;
    strURL = [NSString stringWithFormat:@"sms://%@",strURL];
    NSURL *url = [NSURL URLWithString:strURL];
    [[UIApplication sharedApplication]openURL:url];
}
#pragma mark
//应用打开iOS系统短信息
- (IBAction)openSMsg:(id)sender {
    // 检测系统是否提供短信功能
    if (![MFMessageComposeViewController canSendText]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"您的设备不能发短信" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    // 创建发短信的viewController，指定相应属性
    MFMessageComposeViewController *messageVc = [MFMessageComposeViewController new];
    NSString *to = self.txtTo.text;// 短信接收人
    NSString *body = self.txtBody.text;// 短信内容
    messageVc.recipients = @[to];
    messageVc.body = body;
    // 设置委托
    messageVc.messageComposeDelegate = self;
    // 打开发短信的viewController
    [self presentViewController:messageVc animated:YES completion:nil];
}


#pragma mark
//打开iOS系统邮箱
- (IBAction)SystemMail:(id)sender {

    
    NSString *to=self.txtTo.text;
    NSString *subject=self.txtSubject.text;
    NSString *body=self.txtBody.text;
    
    //UTF-8转换
    NSString * bodyUTF = [body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

//    bodyUTF=self.txtBody.text;
    
    
    NSString *strURL=[NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",to,subject,bodyUTF];
    NSURL *url=[NSURL URLWithString:strURL];
    [[UIApplication sharedApplication]openURL:url];
}
#pragma mark
//应用内打开邮箱
- (IBAction)Mail:(id)sender {
    // 检测系统是否提供邮件功能
    if (![MFMailComposeViewController canSendMail]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告！" message:@"对不起，您的设备不能发邮件！" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        return;
    }
    // 创建发邮件的viewController，指定相应属性
    MFMailComposeViewController *mailVC = [MFMailComposeViewController new];
    NSString *to = self.txtTo.text;// 收件人
    NSString *subject = self.txtBody.text;// 邮件主题
    NSString *body = self.txtBody.text;// 邮件内容
    [mailVC setToRecipients:@[to]];
    [mailVC setSubject:subject];
    [mailVC setMessageBody:body isHTML:YES];
    // 设置委托
    mailVC.mailComposeDelegate = self;
    // 打开发邮件的viewController
    [self presentViewController:mailVC animated:YES completion:nil];
}


#pragma mark MFMessageComposeViewControllerDelegate
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    NSLog(@"sms ok!");
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma -mark MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    NSLog(@"mail ok!");
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 触摸屏幕空白位置回调方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark 回调点击文本框软键盘return键的委托方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



@end
