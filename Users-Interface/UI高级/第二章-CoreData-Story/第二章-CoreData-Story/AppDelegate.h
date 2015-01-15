//
//  AppDelegate.h
//  第二章-CoreData-Story
//
//  Created by 闫潇 on 15/1/15.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;//托管对象上下文(类似于sqlite3的数据库指针)
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;//数据模型
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;//持久储存协调器

- (void)saveContext;//保存上下文
- (NSURL *)applicationDocumentsDirectory;//获取应用的documents目录路径


@end

