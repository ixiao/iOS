//
//  CaculatorManager.h
//  Calculator
//
//  Created by 闫潇 on 14/12/15.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorManager : NSObject
{
    @private
    long long inputNumber;//用户输入的数字
    
}
//获取用户输入数字的方法
-(void)setInputNumber:(long long)number;
@end
