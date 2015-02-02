//
//  ViewController.m
//  自动布局-autolayout
//
//  Created by 闫潇 on 15/2/2.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widthC;//宽度约束
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightC;//高度约束
@property (strong, nonatomic) IBOutlet UIView *aView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//- (IBAction)btnSlider:(id)sender {
//    //1.移除约束
//    [self.view removeConstraint:self.widthC];
//    [self.view removeConstraint:self.heightC];
//    
//    //把所有需要加约束的对象放入字典里
////    NSDictionary * dic = @{@"view":_view};
//    
//    //2.创建新的宽高约束
//    NSArray * c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_aView(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_aView)];
//    
//    NSArray * c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_aView(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_aView)];
//    
//    self.widthC=c1[0];
//    self.heightC=c2[0];
//    
//    //3.添加新的约束
//    [self.view addConstraint:self.widthC];
//    [self.view addConstraint:self.heightC];
//}
#pragma mark 拖动滑块改变视图大小
- (IBAction)sliderValueCahnge:(UISlider *)sender {
    float value =sender.value;
    //1.移除约束
    [self.view removeConstraint:self.widthC];
    [self.view removeConstraint:self.heightC];
    
    //把所有需要加约束的对象放入字典里
    //    NSDictionary * dic = @{@"view":_view};
    
    //2.创建新的宽高约束
    NSArray * c1 = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[_aView(%f)]",value] options:0 metrics:nil views:NSDictionaryOfVariableBindings(_aView)];
    
    NSArray * c2 = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[_aView(%f)]",value] options:0 metrics:nil views:NSDictionaryOfVariableBindings(_aView)];
    
    self.widthC=c1[0];
    self.heightC=c2[0];
    
    //3.添加新的约束
    [self.view addConstraint:self.widthC];
    [self.view addConstraint:self.heightC];
    
    
}

@end
