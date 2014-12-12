//
//  main.m
//  Student
//
//  Created by 闫潇 on 14/12/1.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        Person * p = [Person new];
//        NSLog(@"returnCount:%ld",[p retainCount]);
//        [p retain];
//        [p release];
//        [p release];
//        [p retain];
//        NSLog(@"returnCount:%ld",[p retainCount]);
//        [p retain];
//        NSLog(@"returnCount:%ld",[p retainCount]);
//        NSLog(@"%ld",[p retainCount]);
//    }
    NSMutableArray * arr = [[NSMutableArray array]retain];//1
    NSString * str = [NSString stringWithFormat:@"test"];//1
    [str retain];//2
    [arr addObject:str];//3
    NSLog(@"%@ %ld",str,[str retainCount]);
    [str retain];//4
    [str release];//3
    [str release];//2
    NSLog(@"%@ %ld",str,[str retainCount]);
    [arr removeAllObjects];//1
        NSLog(@"%ld",[arr retainCount]);
    return 0;
//    }
}
