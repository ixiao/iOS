//
//  StudenObserver.m
//  KVO-Demo
//
//  Created by 闫潇 on 14/12/11.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "StudenObserver.h"

@implementation StudenObserver
-(id)initWithStudent:(Student *)newStu
{
    if (self= [super init])
    {
        self.stu = newStu;
//        首先在观察者对象的init方法里调用内观察者对象的
//        -addObserver:forKeyPath:options:context
//        方法,注册成为观察者
        [self.stu addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        [self.stu addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context
{
    if ([keyPath isEqualToString:@"name"])
    {
        NSString * oldName = [change objectForKey:NSKeyValueChangeOldKey];
        NSString * newName = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"键路径%@对应的值发生改变，从%@变成%@",keyPath,oldName,newName);
    }
    else if ([keyPath isEqualToString:@"age"])
    {
        NSString * oldAge = [change objectForKey:NSKeyValueChangeOldKey];
        NSString * newAge = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"键路径%@对应的值发生改变，从%@变成%@",keyPath,oldAge,newAge);
    }
}
-(void)dealloc
{
    [self.stu removeObserver:self forKeyPath:@"name"];
    [self.stu removeObserver:self forKeyPath:@"age"];
}
@end
