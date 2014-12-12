//
//  ViewController.m
//  Fan
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
    
    int index = 0;
    for(int i=0;i<12;i++)
    {
        CGFloat x = 0;
        if(i%2 == 0) x = 5;
        else x = 165;
        if(i%2==0) index = i+1;
        else index = i;
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 274*(i/2)+5*index, 150, 274)];
        
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [scroll addSubview:imgView];
        
    }
    [scroll setContentSize:CGSizeMake(320, 1704)];
    scroll.directionalLockEnabled = YES;
    scroll.bounces = YES;
    scroll.alwaysBounceVertical = YES;
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = YES;
    scroll.decelerationRate = 1;
    scroll.delegate = self;
    [self.view addSubview:scroll];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.y);
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
    NSLog(@"scrollViewDidEndDecelerating");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
