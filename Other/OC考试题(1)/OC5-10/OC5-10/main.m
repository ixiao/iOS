//
//  main.m
//  OC5-10
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

//    NSMutableArray * arr = @[@"a",@"f",@"x",@"k"];
    //通过代码对此数组进行降序排列
    
    NSMutableArray *arr=[NSMutableArray arrayWithObjects:@"a",@"f",@"x",@"k", nil];
    
    [arr sortUsingComparator:^NSComparisonResult(id obj1,id obj2) {
        NSComparisonResult result=[obj2 compare:obj1];
        return result;
    }];
    NSLog(@"%@",arr);
    
    
    return 0;
}

