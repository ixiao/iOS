//
//  instance.m
//  OC-10-单例
//
//  Created by ibokan on 14-12-4.
//  Copyright (c) 2014年 少帅. All rights reserved.
//

#import "instance.h"

@implementation instance

static instance * instanc;
//单例方法
+(instancetype)sharedSingleton{
    if (!instanc) {
        NSLog(@"调用alloc分配内存");
        instanc = [[instance alloc]init];
    }
    return instanc;
}
//重写allocWithZone：方法防止用户直接alloc对象
+(id)allocWithZone:(struct _NSZone *)
    zone{
    NSLog(@"再次调用");
    if (!instanc) {
        instanc = [super allocWithZone:zone];
    }
    return instanc;
}
//自己定义的类一般在copyWithZone中完成浅拷贝，在mutableCopyZone中完成深拷贝.
-(id)copyWithZone:(NSZone *)zone{
    NSLog(@"调用copy");
    return self;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    NSLog(@"调用mutable");
    return self;
}



@end
