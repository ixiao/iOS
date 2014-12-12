//
//  main.m
//  Danli
//
//  Created by 闫潇 on 14/12/4.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "instance.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        instance * instance1 = [instance sharedSingleton];
        instance * instance2 = [instance sharedSingleton];
        instance * instance3 = [instance sharedSingleton];
        instance * instance4 = [[instance alloc]init];
        instance * instance5 = [instance1 copy];
        instance * instance6 = [instance1 mutableCopy];
        NSLog(@"\ninstance1:%p\ninstance2:%p\ninstance3:%p\tinstance4:%p",instance1,instance2,instance3,instance4);
        NSLog(@"instance5:%p",instance5);
        NSLog(@"instance6:%p",instance6);
        
        
        
    }
    return 0;
}