//
//  ViewController.m
//  跑马灯图片效果
//
//  Created by 闫潇 on 14/12/22.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"
#define kwidth 300
#define kheight 240
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建image名称数组
    NSArray * imageNames = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    
    self.myScrollView.contentSize=CGSizeMake(kwidth * 4, kheight);
//    循环创建imageView放入scrollView中
    for (int i = 0; i<4; i++)
    {
        UIImage * image = [UIImage imageNamed:imageNames[i]];
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kwidth * i, 0 , kwidth, kheight)];
        imageView.image=image;
        [self.myScrollView addSubview:imageView];
    }
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(marquee:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)marquee:(NSTimer *)timer;
{
    static int i =-1;
    i++;
    if (i==4)
    {
        i=-1;
    }
    //使用UIview动画完成广告图片走马灯效果
    [UIView animateWithDuration:1 animations:^
     {
         self.myScrollView.contentOffset=CGPointMake(kwidth * i, 0);
     }
     
     ];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
