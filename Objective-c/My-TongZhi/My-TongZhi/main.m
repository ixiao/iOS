//
//  main.m
//  My-TongZhi
//
//  Created by 闫潇 on 14/12/9.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Farmer.h"
#import "Work.h"
#import "King.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Farmer * farmer = [Farmer new];
        King *  king = [King new];
        [king senMessage];
    }
    return 0;
}
