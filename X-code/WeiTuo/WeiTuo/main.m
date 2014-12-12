//
//  main.m
//  WeiTuo
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZhongJie.h"
#import "FangDong.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        ZhongJie * zhong = [ZhongJie new];
        [zhong saleHose];
        
        FangDong * fang = [FangDong new];
        [fang saleHose];
    }
    return 0;
}

