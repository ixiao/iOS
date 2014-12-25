//
//  ViewController.m
//  控件-home
//
//  Created by 闫潇 on 14/12/21.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *TextView;
@property (strong, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField.delegate=self;
    self.TextView.delegate=self;
}

- (IBAction)closeKeyboard:(UIButton *)sender {
    [self.textField resignFirstResponder];
}
- (IBAction)changeValue:(UISwitch *)sender {
    BOOL is = sender.isOn;
    [self.leftSwitch setOn:is animated:YES];
    [self.rightSwitch setOn:is animated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)editingLbel:(UITextField *)sender {
    self.label.text=self.textField.text;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (self.segmentControl.selectedSegmentIndex == 1)
    {
        if ([@"\n" isEqualToString:text])
        {
            [self.TextView resignFirstResponder];
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
