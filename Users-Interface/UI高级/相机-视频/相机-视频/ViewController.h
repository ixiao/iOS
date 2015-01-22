//
//  ViewController.h
//  相机-视频
//
//  Created by 闫潇 on 15/1/22.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ASIFormDataRequest.h"
#define UPLOADURL @"http://edutohome.sinaapp.com/pages/admin/upload/upload.php"
@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,ASIHTTPRequestDelegate>


@end

