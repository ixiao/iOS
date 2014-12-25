//
//  ViewController.m
//  ImageView-动画-控件
//
//  Created by 闫潇 on 14/12/22.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建动画帧数组
    NSMutableArray * images = [NSMutableArray new];
    for (int i = 1; i<15; i++)
    {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"t%d.tiff",i]];
        [images addObject:image];
    }
    
    //指定imageView的动画帧数组属性
    self.myImageView.animationImages = images;
    //指定动画的持续时间
    self.myImageView.animationDuration = 1;
    //开始imageView动画
    [self.myImageView startAnimating];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
