//
//  main.m
//  Home—NSarray
//
//  Created by 闫潇 on 14/12/1.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSArray * arr = [NSArray arrayWithObjects:@"范腾飞",@"李亚梅",@"牛少帅",@"曹少奇",@"王海",@"陈道斌",@"杨雪飞",@"秦勇奇", nil];
//        NSLog(@"%ld",[arr count]);
//        NSString * str = [arr objectAtIndex:5];
//        NSLog(@"%@",str);
//        NSLog(@"-----快速枚举");
//        for (id obj in arr) {
//            NSLog(@"%@",obj);
//        }
//        arr = @[@"yangyi",@"xiaoer",@"zhangsan",@"lisi",@"wangwu"];
//        for (int i = 0; i<[arr count]; i++)
//        {
//            NSString * str = [arr objectAtIndex:i];
//            NSLog(@"%@",str);
//        }
//        NSLog(@"-----可变数组的快速枚举");
//        NSMutableArray * mAr = [NSMutableArray new];
//        [mAr addObject:@"孙悟空"];
//        [mAr addObject:@"猪八戒"];
//        [mAr addObject:@"沙悟净"];
//        [mAr addObject:@"白骨精"];
//        for (id obj in mAr) {
//            NSLog(@"%@",obj);
//        }
//        NSLog(@"----删除一个数组后");
//        [mAr removeObject:@"孙悟空" inRange:NSMakeRange(1, 2)];
//        for (id obj in mAr) {
//            NSLog(@"%@",obj);
//        }
        NSArray * arr = @[@"yangyi",@"xiaoer",@"zhangsan",@"lisi",@"yangyi",@"wangwu"];
        for (int i = 0; i<[arr count]; i++)
        {
            NSString * str = [arr objectAtIndex:i];
            NSLog(@"%@",str);
        }
        NSLog(@"===============");
        NSMutableArray * mAr = [NSMutableArray new];
        for (int i = 0; i<[arr count]; i++)
        {
            if (![mAr containsObject:arr[i]])
            {
                [mAr addObject:arr[i]];
            }
        }
        for (id obj in mAr) {
            NSLog(@"%@",obj);
        }
        
        
    }
    return 0;
}
