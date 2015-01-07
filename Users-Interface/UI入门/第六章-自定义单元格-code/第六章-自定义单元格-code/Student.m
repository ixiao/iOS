//
//  Student.m
//  CustomCellByCode
//
//  Created by hejin on 13-12-15.
//  Copyright (c) 2013年 e世雕龙. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize icon,name,nickname;
//
- (Student *)initWithName:(NSString *)aName andNickname:(NSString *)aNickname andIcon:(UIImage *)aImage {
    if(self = [super init]){
        self.icon = aImage;
        self.name = aName;
        self.nickname = aNickname;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"My name is %@,My nickname is %@",self.name,self.nickname];
}
@end
