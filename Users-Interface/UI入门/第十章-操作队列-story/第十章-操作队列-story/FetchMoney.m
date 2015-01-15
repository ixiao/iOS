//
//  FetchMoney.m
//  第十章-操作队列-story
//
//  Created by 闫潇 on 15/1/13.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "FetchMoney.h"

@implementation FetchMoney
-(void)main
{
    //线程一
    NSThread * husband = [[NSThread alloc]initWithTarget:self selector:@selector(fetchMoney:) object:@"大丈夫"];
    [husband start];
    
    //线程二
    NSThread * wife = [[NSThread alloc]initWithTarget:self selector:@selector(fetchMoney:) object:@"大老婆"];
    [wife start];
}
#pragma mark  取钱方法
-(void)fetchMoney:(NSString *)who
{
    static  int money = 10000;//余额
//    NSLog(@"%@取钱,取之前%d",who,money);
    money -= 2000;
    NSLog(@"%@取钱,取之后%d",who,money);


}
@end
