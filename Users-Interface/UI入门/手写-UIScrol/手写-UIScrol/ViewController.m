//
//  ViewController.m
//  手写-UIScrol
//
//  Created by 闫潇 on 14/12/22.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) UIProgressView * progressView;
@property (nonatomic,strong) UIActivityIndicatorView * activityIndicatorView;
@property (nonatomic,strong) UIPageControl * pageControl;
@property (nonatomic,strong) UIImageView * imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate=self;//绑定进度条的委托
#pragma 活动显示器(小菊花)
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(65, 40, 190, 2)];
    [self.view addSubview:self.progressView];
#pragma ScrollView
    self.activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(25, 30, 20, 20)];
    //活动显示器的显示风格
    [self.activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.activityIndicatorView startAnimating];
    [self.view addSubview:self.activityIndicatorView];
    
    //创建ScrollView 整页滑动
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    //设置Scroll一次滑动一页
    self.scrollView.pagingEnabled=YES;
    
    self.scrollView.delegate=self;//绑定委托
    //ScrollView 委托viewController完成一些工作
    [self.view addSubview:self.scrollView];
    
    //使用定时器 每隔一段时间模拟进度条活动
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(loading:) userInfo:nil repeats:YES];
    
    //创建pageControll对象
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(140, 400, 40, 40)];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage=0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.userInteractionEnabled=YES;
    // Do any additional setup after loading the view, typically from a nib.
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
