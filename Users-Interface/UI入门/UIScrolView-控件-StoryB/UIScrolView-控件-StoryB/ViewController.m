//
//  ViewController.m
//  UIScrolView-控件-StoryB
//
//  Created by 闫潇 on 14/12/22.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;//进度条
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;//活动指示器
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic,strong) UIImageView * myImageview;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate=self;
    [self.activityIndicator startAnimating
     ];//活动指示器开始转动
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(loading:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 加载图片的方法
-(void)loading:(NSTimer *)timer
{
    //判断进度条进度是否是百分百
    //进度是百分百加载图片
    if (self.progressView.progress !=1)
    {
        self.progressView.progress +=5.0f/100;
        
    }
    else
    {//进度是百分百的加载图片
        [timer invalidate];
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden=YES;
        self.progressView.hidden=YES;
        [self loadImage];
        
        
    }
    
}
#pragma mark 加载图片方法
-(void)loadImage
{
    //创建image对象
    UIImage * image =[UIImage imageNamed:@"Lion"];
    self.myImageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    self.myImageview.image = image;
    [self.scrollView addSubview:self.myImageview];
    
    //指定scrollView的contenSize(内容大小)
    self.scrollView.contentSize = self.myImageview.frame.size;
    self.scrollView.pagingEnabled=YES;
    //设置scrollView每次滑动一页
    
}
#pragma mark 次委托方法在scrollView滚动结束时回调
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //完成scroll跟control联动
    //其实就是根据scrollView的偏移量pageControl的当前野马并设置
    NSUInteger pageNo = self.scrollView.contentOffset.x/self.view.frame.size.width;
    
    self.pageControl.currentPage=pageNo;
}
#pragma mark 点击pageControl改变scrollView的偏移量
-(void)pageControlValueChanged:(UIPageControl *)sender;
{
    //根据选中的pageControll页码改变scrollView偏移量
    CGPoint point = self.scrollView.contentOffset;
    point.x = sender.currentPage *self.view.frame.size.width;
    self.scrollView.contentOffset = point;
}

@end
