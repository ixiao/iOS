//
//  main.m
//  Demo 代码
//
//  Created by 闫潇 on 14/11/25.
//  Copyright (c) 2014年 yan. All rights reserved.
//

//#import <Foundation/Foundation.h>
//int main (int argc, const char * argv[]) {
//    @autoreleasepool {
//        NSMutableArray *listOfLetters = [NSMutableArray
//                                         arrayWithObjects:@"A", @"B", @"C", nil];
//        NSString *stringObject1 = [listOfLetters objectAtIndex:0]; NSLog(@"stringObject1 = %@", stringObject1);
//        NSString *stringObject2 = [listOfLetters lastObject]; NSLog(@"stringObject2 = %@", stringObject2);
//        NSUInteger position = [listOfLetters indexOfObject:@"B"]; NSLog(@"position = %lu", position);
//    }
//    return 0;
//}

#import <Foundation/Foundation.h>
int main (int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *string1 = [NSMutableString stringWithString:@"A"]; NSMutableString *string2 = [NSMutableString stringWithString:@"B"]; NSMutableString *string3 = [NSMutableString stringWithString:@"C"];
        NSArray *listOfObjects = [NSArray arrayWithObjects:string1, string2, string3, nil];
        for(NSMutableString *s in listOfObjects){
            NSLog(@"This string in lowercase is %@", [s lowercaseString]);
        }
        [listOfObjects makeObjectsPerformSelector:@selector(appendString:) withObject:@"-MORE"];
        [listOfObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"object(%lu)'s description is %@",idx, [obj description]); }];
    }
    return 0;
}

