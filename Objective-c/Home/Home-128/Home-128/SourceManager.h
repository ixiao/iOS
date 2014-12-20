//
//  SourceManager.h
//  OC-ywlj3
//
//  Created by 徐赢 on 14-9-11.
//  Copyright (c) 2014年 徐赢. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SourceManagerDelegate;

@interface SourceManager : NSObject

@property(nonatomic,strong)id<SourceManagerDelegate>delegate;

-(void)qingqiuMusicURl;

@end

@protocol SourceManagerDelegate <NSObject>

@optional
-(void)sourceManager:(SourceManager *)sm didReceiveURL:(NSString *)url;

-(void)sourceManager:(SourceManager *)sm didReceiveError:(NSError *)error;

@end

