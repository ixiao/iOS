//
//  main.m
//  BlockCompare
//
//  Created by 闫潇 on 14/12/8.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
void useCodeBlock(int(^myBlock)(int x,int y)){
    int result = myBlock(300,200);
    NSLog(@"result = %d",result);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //代码块排序
        NSMutableArray * mAr = [NSMutableArray arrayWithObjects:@"zbb",@"caa",@"acd",@"bcd", nil];
        //使用代码块进行数组排序
        [mAr sortUsingComparator:^NSComparisonResult(id obj1,id obj2)
        {
            NSString * str1 =obj1;
            NSString * str2 =obj2;
            return ([str1 compare:str2])  ;

        }];
        NSLog(@"排序后");
        NSLog(@"%@",mAr) ;
        
        
        int(^addBlock)(int x,int y) = ^(int x,int y)
        {
            return x+y;
        };
        useCodeBlock(addBlock);
        
        int(^subBlock)(int x,int y) =^(int x,int y)
        {
            return x-y;
        };
        useCodeBlock(subBlock);
        
        
        
    };
    return 0;
}
