//
//  main.m
//  JiSuan
//
//  Created by 闫潇 on 14/11/16.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Controller.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i =10, j = 20;
        Controller * c = [Controller new];
        int rst = [c handData:i andOther:j];
        if (rst != -1)
        {
            NSLog(@"rst = %d",rst);
        }
        
    }
    return 0;
}
