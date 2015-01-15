//
//  myView.m
//  第九章-UIResponder-change
//
//  Created by 闫潇 on 15/1/12.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "myView.h"

@implementation myView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


#pragma mark 4个手势通知方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"My name is %@",_name);
    //触摸对象及事件  往下传递
    [self.nextResponder touchesBegan:touches withEvent:event];
}
@end
