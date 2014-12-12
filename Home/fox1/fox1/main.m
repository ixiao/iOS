//
//  main.m
//  fox1
//
//  Created by 闫潇 on 14/11/16.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray * listOfLetters1= [NSArray arrayWithObjects:@"A",@"B",@"C", nil];
        NSLog(@"list = %@",listOfLetters1);
        NSNumber * number1 = [NSNumber numberWithInt:1];
        NSNumber * number2 = [NSNumber numberWithInt:2];
        NSNumber * number3 = [NSNumber numberWithInt:3];
        
        NSMutableArray *listOfNumbers = [[NSMutableArray alloc]initWithObjects:number1,number2,number3, nil];
        NSLog(@"ListOfNumber = %@",listOfNumbers);
        
        id list[3];
        list[0]= @"D";
        list[1]= @"E";
        list[2]= @"F";
        
        NSMutableArray * ListOfLetters2 = [[NSMutableArray alloc]initWithObjects:list count:3];
        NSLog(@"ListOfNumbers2 = %@",ListOfLetters2);
        
    }
    return 0;
}
