//
//  Student.m
//  第八章-归档
//
//  Created by 闫潇 on 15/1/6.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "Student.h"

@implementation Student
- (NSString *)description
{
    return [NSString stringWithFormat:@"My name is %@,my age is %d ,my adress is %@", _name,_age,_adress];
}
// 便利初始化函数
- (instancetype)initWithDict:(NSDictionary *)dict {
    Student *stu = [Student new];
    stu.name = dict[@"name"];
    stu.age = [dict[@"age"]intValue];
    stu.adress = dict[@"adress"];
    return stu;
}
////归档
//- (void)encodeWithCoder:(NSCoder *)coder
//{
//    //编码器将对象的属性  进行编码
//    [coder encodeObject:self.name forKey:@"name"];
//    [coder encodeInt:self.age forKey:@"age"];
//    [coder encodeObject:self.adress forKey:@"adress"];
//    
//    
//}
////解档
//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super init];
//    if (self) {
//        //编码器将对象的实例变量解档
//        self.name = [coder decodeObjectForKey:@"name"];
//        self.age = [coder decodeIntForKey:@"age"];
//        self.adress = [coder decodeObjectForKey:@"adress"];
//    }
//    return self;
//}
@end
