//
//  ViewController.m
//  手写控件-home
//
//  Created by 闫潇 on 14/12/21.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton * button;
@property (nonatomic,strong) UILabel * label;
@property (nonatomic,strong) UITextField * textField;
@property (nonatomic,strong) UITextView * textView;
@property (nonatomic,strong) UISwitch * leftSwitch;
@property (nonatomic,strong) UISwitch * rightSwitch;
@property (nonatomic,strong) UISegmentedControl * segmentControl;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self myView];
    self.textField.delegate=self;
    self.textView.delegate=self;//绑定委托
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)myView
{
    //创建button按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(230, 40, 60, 40);
    [button setTitle:@"触摸" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
    //创建label标签
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(110, 50, 100, 20)];
    [self.label setText:@"Hello World"];
    self.label.textColor = [UIColor redColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines=1;
    self.label.font = [UIFont systemFontOfSize:18];
    self.label.backgroundColor= [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.5];
//    self.label.textColor = [UIColor colorWithRed:53.0 green:195.0 blue:68.0 alpha:1];
    [self.view addSubview:self.label];
    
    
    //创建textfield
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(80, 100, 160, 30)];
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.textField.font = [UIFont systemFontOfSize:18];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"请输入银行卡密码" ;
    self.textField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    [self.view addSubview:self.textField];
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    self.label.text=self.textField.text;
    return YES;
}
-(void)doButton:(UIButton *)sender
{
    [self.textField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
