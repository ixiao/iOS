//
//  ViewController.m
//  demo
//
//  Created by 闫潇 on 14/11/17.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView * scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    for(int i=0;i<11;i++)
    {
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(320*i, 0, 320, 210)];
        
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [scroll addSubview:imgView];
        
    }
    [scroll setContentSize:CGSizeMake(320*11., 210)];
    scroll.directionalLockEnabled = YES;
    scroll.bounces = NO;
    scroll.alwaysBounceVertical = NO;
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = YES;
    scroll.decelerationRate = 1;
    scroll.delegate = self;
    [self.view addSubview:scroll];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"立即体验" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(3300, 50, 80, 30)];
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 5;
    [scroll addSubview:btn];
    
    UIPageControl * page = [[UIPageControl alloc] initWithFrame:CGRectMake(85, 180, 150, 5)];
    currPageControl = page;
    page.numberOfPages = 11;
    page.currentPage = 0;
    page.pageIndicatorTintColor = [UIColor whiteColor];
    page.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:page];
    
    
    UIActivityIndicatorView * aiv = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 40, 20, 20)];
    aiv.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.view addSubview:aiv];
    [aiv startAnimating];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.x);
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat currX = scrollView.contentOffset.x;
    int page = currX / 320;
    currPageControl.currentPage = page;
    NSLog(@"%d",page);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end