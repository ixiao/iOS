//
//  Student.h
//  CustomCellByCode
//
//  Created by hejin on 13-12-15.
//  Copyright (c) 2013年 e世雕龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Student : NSObject
@property (strong, nonatomic) UIImage *icon;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *nickname;

- (Student *)initWithName:(NSString *)aName
              andNickname:(NSString *)aNickname
                  andIcon:(UIImage *)aImage;
@end
