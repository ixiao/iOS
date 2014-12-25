//
//  ViewController.m
//  第三章、活动表控件
//
//  Created by 闫潇 on 14/12/23.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 更多选项
- (IBAction)moreOption:(UIButton *)sender {
    //创建动作表(更多选项)
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"请选择你的妃子" delegate:self cancelButtonTitle:@"随便" destructiveButtonTitle:@"都滚吧" otherButtonTitles:@"沉鱼",@"落雁",@"闭月",@"羞花", nil];
    //视图上显示操作表
    [actionSheet showInView:self.view];
}

#pragma mark 操作表回调方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //根据用户选择的选项完成相应的工作
    switch (buttonIndex)
    {
        case 0:
            NSLog(@"您选择了删除！");
            break;
        case 1:
            NSLog(@"您选择了复制！");
            break;
        case 2:
            NSLog(@"您选择了粘贴！");
            break;
        case 3:
            NSLog(@"您选择了剪切！");
            break;
        case 4:
            NSLog(@"您选择了取消！");
            break;
            
        default:
            break;
    }
}

#pragma  mark 警告窗口
- (IBAction)alertWindow:(UIButton *)sender {
    //创建警告窗口
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"您确定这么干" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //弹出警告窗口
    [alertView show];
}

#pragma mark 警告窗口回调的方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            NSLog(@"您选择了取消");
            break;
        case 1:
            NSLog(@"您选择了确定");
            break;
        case 2:
            NSLog(@"您选择了取消");
            break;
            
        default:
            break;
    }
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end


