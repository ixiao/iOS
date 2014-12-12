//
//  main.m
//  Demo-NSArray
//
//  Created by 闫潇 on 14/11/27.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSArray * arr = [NSArray arrayWithObjects:@"a",@"b",@"c", nil];
//        NSArray * arr = [NSArray arrayWithObjects:@"a",@"b","c", nil];
        NSUInteger length = [arr count];
        NSLog(@"%ld",length);
        NSString * str = [arr objectAtIndex:2];
        NSLog(@"%@",str);
        for (int i = 0; i<[arr count]; i++)
        {
            NSString * str = [arr objectAtIndex:i];
            NSLog(@"str:%@",str);
        }
        
        arr = @[@"zhangsan",@"lisi",@"wangwu"];
        for (int i= 0; i<[arr count]; i++)
        {
            NSString * str = [arr objectAtIndex:i];
            NSLog(@"%@",str);
        }
        
//        NSLog(@"%@",str1);
        
        NSMutableArray * mArr = [NSMutableArray arrayWithCapacity:10];
        [mArr addObject:@"孙悟空"];
        [mArr addObject:@"唐僧"];
        [mArr addObject:@"八戒"];
        for (int i =0; i<[mArr count]; i++)
        {
            NSString * str2 = mArr[i];
            NSLog(@"%@",str2);
        }
        [mArr removeObjectAtIndex:2];
        for (int i =0; i<[mArr count]; i++)
        {
            NSString *str = mArr[i];
            NSLog(@"%@",str);
        }
        [mArr addObject:@"李亚梅"];
        [mArr addObject:@"白龙马"];
        NSLog(@"----插入李亚梅后");
        for (int i =0; i<[mArr count]; i++)
        {
            NSString *str = mArr[i];
            NSLog(@"%@",str);
        }
        [mArr removeObject:@"李亚梅"];
        for (int i =0; i<[mArr count]; i++)
        {
            NSString *str = mArr[i];
            NSLog(@"%@",str);
        }
        [mArr insertObject:@"如来" atIndex:0];
        NSLog(@"------插入如来后");
        for (int i =0; i<[mArr count]; i++)
        {
            NSString *str = mArr[i];
            NSLog(@"%@",str);
        }
        [mArr replaceObjectAtIndex:3 withObject:@"牛少帅"];
        NSLog(@"----把索引3位置的对象替换为 牛少帅之后");
        //for 循环  遍历
        for (int i =0; i<[mArr count]; i++)
        {
            NSString *str = mArr[i];
            NSLog(@"%@",str);
        }
        NSLog(@"----使用枚举器遍历");
        NSEnumerator *enumerator = [mArr objectEnumerator];
        //使用while 循环来遍历枚举器
        id obj = nil;
        while (obj = [enumerator nextObject])
        {
            NSLog(@"%@",obj);
        }
        //推荐使用快速枚举
        NSLog(@"----快速枚举遍历");
        for (NSString * str  in mArr)
        {
            NSLog(@"%@",str);
        }
        NSLog(@"----字典");
        Student *  stu1 = [Student new];
        stu1.name = @"李雅梅";
        stu1.age = 28;
        Student * stu2 = [Student new];
        stu2.name = @"范腾飞";
        stu2.age = 16;
        Student * stu3 =[Student new];
        stu3.name = @"牛少帅";
        stu3.age =21;
        Student * stu4 =[Student new];
        stu4.name = @"刘恒槟 王树刚";
        stu4.age =21;
        NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:stu1,@"tag",stu2,@"monkey",stu3,@"pig",stu4,@"dog", nil];
        NSLog(@"dic:%@",dic);
        Student  * stu =[dic objectForKey:@"pig"];
        NSLog(@"%@",stu);
        NSArray * keys =[dic allKeys];
        NSLog(@"keys:%@",keys);

        
        
        NSMutableDictionary * mDic =[NSMutableDictionary dictionaryWithCapacity:10];
        [mDic setObject:stu1 forKey:@"haha"];
        [mDic setObject:stu2 forKey:@"hehe"];
        [mDic setObject:stu3 forKey:@"hoho"];
        [mDic setObject:stu4 forKey:@"hengheng"];
        stu  =mDic[@"ghost"];
        NSLog(@"stu:%@",stu);
        //不可变set集合
        NSSet * set =[NSSet setWithObjects:@"one",@"two",@"three",@"four", nil];
        for (id obj in set) {
            NSLog(@"%@",obj);
        }
        NSLog(@"移除前");
        NSMutableSet * mSet = [NSMutableSet setWithCapacity:20];
        [mSet addObject:@"yi"];
        [mSet addObject:@"er"];
        [mSet addObject:@"san"];
        [mSet addObject:@"si"];
        for (id obj in mSet) {
            NSLog(@"%@",obj);
        }
        [mSet removeObject:@"er"];
        NSLog(@"移除后:");
        for (id obj in mSet) {
            NSLog(@"%@",obj);
        }
        NSLog(@"----------Beng caca");
//        有一个数组中有一系列姓名，但可能有重复，请说明如何将重复的性别去掉
        NSArray * name =[NSArray arrayWithObjects:@"zhangsan",@"lisi",@"wangwu",@"maliu",@"lisi" ,nil];
        NSLog(@"%@",name);
        NSMutableArray * mArr1 =[NSMutableArray arrayWithCapacity:10];
        for (int i=0; i<[name count]; i++)
        {
            if ([mArr1 containsObject:name[i] ]== NO)
            {
                [mArr1 addObject:name[i]];
            }
        }
        NSLog(@"%@",mArr1);
//        编写程序，以数组存储字符串”元芳”、”华生”、”平次”，并用循环语句输出数组中存储的所有字符串.
        NSMutableArray * arr1 = [NSMutableArray new];
        [arr1 addObject:@"元芳"];
        [arr1 addObject:@"华生"];
        [arr1 addObject:@"平次"];
        for (id obj  in arr1)
        {
            NSLog(@"%@",obj);
        }
        NSLog(@"----不定项个字符串");
//        尝试使用可变数组版本进行程序扩展，可以存放不定项个字符串。
        NSMutableArray * arr2 = [[NSMutableArray alloc]init];
        [arr2 addObject:@"one"];
        [arr2 addObject:@"two"];
        [arr2 addObject:@"three"];
        [arr2 addObject:@"four"];
        for (id obj in arr2) {
            NSLog(@"%@",obj);
        }
        [mArr1 sortUsingSelector:@selector(compare:)];
        NSLog(@"-=-=-=-=-=-");
        for (id obj in mArr1) {
            NSLog(@"%@",obj);
        }
//        编写程序，以可变数组存储1到10之间的不重复的随机整数，再对这个数组进行从小到大排序，最后用循环语句输出所有值
        NSMutableArray * mArr2 =[NSMutableArray new];
        for (int i =0; i<10; i++) {
            NSNumber * num =[NSNumber numberWithInt:(arc4random()%10)+1];
            if ([mArr2 containsObject:num]==NO) {
                [mArr2 addObject:num];
            }
            else
                i--;
        }
        NSLog(@"%@",mArr2);
        
//编写程序，使用字典存放”狄仁杰”、”福尔摩斯”和“柯南”以及他们对应的副手名字，最后以循环语句输出三组不同的”xxx问：yyy，这事你怎么看？
        NSMutableDictionary * mDic1 = [NSMutableDictionary new];
        [mDic1 setObject:@"狄仁杰" forKey:@"元芳"];
        [mDic1 setObject:@"福尔摩斯" forKey:@"华生"];
        [mDic1 setObject:@"柯南" forKey:@"平次"];
//        NSArray * arr3 = [mDic1 allKeys];fa
//        for (int i =0 ; i<[arr3 count]; i++)
//        {
//            NSLog(@"%@问：%@，此事你怎么看？",mDic1[[arr3 objectAtIndex:i]],arr3[i]);
//        }
        for (id obj in mDic1)
        {
            NSLog(@"%@问：%@，此事你怎么看？",[mDic1 objectForKey:obj],obj);
        }
        NSLog(@"----不可变数组");
        NSDictionary * dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"狄仁杰",@"元芳",@"福尔摩斯",@"华生",@"柯南",@"平次", nil];
//                NSArray * arr4 = [dic2 allKeys];
        for (id ob in dic2) {
            NSLog(@"%@问：%@，此事你怎么看？",[dic2 objectForKey:ob],ob);
        }
        
        
        
        
//        
//        
////        取出字符串“123-456-789-000”中的数字部分，组成一个新的字符串输出，（提示：可变字符串；返回数组）
//        NSMutableString * mStr = [NSMutableString stringWithFormat:@"123-456-789-000"];
//        NSArray * arr = [mStr componentsSeparatedByString:@"-"];
//        NSMutableString * mS = [NSMutableString new];
//        for (id obj in arr) {
//            [mS appendString:obj];
//        }
//        NSLog(@"%@",mS);
//        
////        放四个十进制三位数到一个数组中，然后按从小到大排序后组成一个新的数组
//        NSLog(@"------");
////        NSMutableArray * mAr = [NSMutableArray new];
//        NSNumber *  num1 = [NSNumber numberWithInt:213];
//        NSNumber *  num2 = [NSNumber numberWithInt:897];
//        NSNumber *  num3 = [NSNumber numberWithInt:456];
//        NSArray * arr1 = [NSArray arrayWithObjects:num1,num2,num3, nil];
//        NSArray * arr2 = [arr1 sortedArrayUsingSelector:@selector(compare:)];
//        NSLog(@"%@",arr2);
    }
    return 0;
    }


