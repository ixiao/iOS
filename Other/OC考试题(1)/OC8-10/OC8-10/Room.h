//
//  Room.h
//  OC8-10
//
//  Created by 徐赢 on 14-7-10.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>


//现在有两个基础组件，空调和温度计
//业务逻辑要求：使用空调和温度计降房屋内温度保持在24度以下。
//代码无需运行，只看对业务逻辑的实现

@interface Room : NSObject
@property(nonatomic,assign)NSInteger temp;

@end
