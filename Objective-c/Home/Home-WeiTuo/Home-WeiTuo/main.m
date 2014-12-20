//
//  main.m
//  Home-WeiTuo
//
//  Created by 闫潇 on 14/12/3.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student+Work.h"
#import "Teacher.h"
#import "Student.h"
//创建Student类，使其对外只有age和name属性，但通过延展实现不公开的sayHi方法，并在初始化实例的时候自动调用此方法。
#import "Student.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Student * stu = [Student new];
        stu.name =@"yan";
        stu.age =20;
        NSLog(@"%@",stu);
//        已知Student类含有age和name属性，通过类目方式为其添加work方法，并将此类目保存为Student+Working。
        [stu work];
        [stu Work];
        
//        已知同为Person类子类的Student和Teacher两个类，编写协议WorkingPartner要求这两个类遵循之并实现work方法
        Teacher * tea = [Teacher new];
        [tea Work];
        
    }
    return 0;
}

