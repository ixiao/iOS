//
//  FileManager.h
//  OC-xy
//
//  Created by 徐赢 on 14-9-11.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

//文件管理系统要声明一个添加文件的方法
//该方法要求，被添加的文件可以是任何对象
//但是，该对象必须具有一个 -(void)read方法和一个可选的-(void)write方法

@end
