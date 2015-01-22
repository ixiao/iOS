//
//  ViewController.m
//  相机-视频
//
//  Created by 闫潇 on 15/1/22.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;// 图像视图
@property (strong, nonatomic) IBOutlet UIView *videoview;//内嵌播放视频窗口的视图
@property (nonatomic,strong) UIImagePickerController * imagePickerController;//图片选取器
@property (nonatomic,strong) MPMoviePlayerController * moviePlayerController;//视频选取器


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 选取已有图片和视频
- (IBAction)chooseExistPhotoOrVideo:(id)sender
{
    // 检查是否有图片库（图片选取器的isSourceTypeAvailable类方法）
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        [self myAlert:@"对不起您的设备不存在图片库"];
        
    }
    // 检查图片选取器是否存在，不存在创建并指定委托
    if (!self.imagePickerController) {
        self.imagePickerController = [UIImagePickerController new];
        self.imagePickerController.delegate = self;
    }
    // 设定照相机可以获取那些类型的媒体（图片选取器的mediaTypes属性kUTTypeMovie和kUTTypeImage）
    self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie];
    // 设定图片的来源为图片库（图片选取器的sourceType属性UIImagePickerControllerSourceTypePhotoLibrary）
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // 打开图片选取器视图控制器（模态视图方式）
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark 拍摄新的照片
- (IBAction)shootNewPhoto:(id)sender
{
    // 检查是否有相机（图片选取器的isSourceTypeAvailable类方法）
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告！" message:@"对不起，您的设备不存在相机！" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        return;
    }
    // 检查图片选取器是否存在，不存在创建并指定委托
    if (!self.imagePickerController) {
        self.imagePickerController = [UIImagePickerController new];
        self.imagePickerController.delegate = self;
    }
    // 设定照相机可以获取那些类型的媒体（图片选取器的mediaTypes属性kUTTypeMovie或者kUTTypeImage）
    self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
    // 设定图片的来源为摄像头（图片选取器的sourceType属性UIImagePickerControllerSourceTypeCamera）
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 设定图片选取器的摄像头捕获模式（图片选取器的cameraCaptureMode属性UIImagePickerControllerCameraCaptureModePhoto或者UIImagePickerControllerCameraCaptureModeVideo）
    self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    // 设定使用前置摄像头，默认是后置摄像头
    self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    // 打开图片选取器视图控制器（模态视图方式）
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
#pragma mark 拍摄新的视频
- (IBAction)shootNewVideo:(id)sender
{
    // 检查是否有相机（图片选取器的isSourceTypeAvailable类方法）
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告！" message:@"对不起，您的设备不存在相机！" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        return;
    }
    // 检查图片选取器是否存在，不存在创建并指定委托
    if (!self.imagePickerController) {
        self.imagePickerController = [UIImagePickerController new];
        self.imagePickerController.delegate = self;
    }
    // 设定照相机可以获取那些类型的媒体（图片选取器的mediaTypes属性kUTTypeMovie或者kUTTypeImage）
    self.imagePickerController.mediaTypes = @[(NSString *)kUTTypeMovie];
    // 设定图片的来源为摄像头（图片选取器的sourceType属性UIImagePickerControllerSourceTypeCamera）
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 设定图片选取器的摄像头捕获模式（图片选取器的cameraCaptureMode属性UIImagePickerControllerCameraCaptureModePhoto或者UIImagePickerControllerCameraCaptureModeVideo）
    self.imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    // 设置摄像图像品质
    self.imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    // 打开图片选取器视图控制器（模态视图方式）
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark 打开图片选取器和视图控制器回调的方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 从info字典参数中获取媒体类型
    NSString * mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    // 判断媒体类型是否为图片
    if ([mediaType isEqualToString:(NSString *) kUTTypeImage])
    {
        // 如果是则从info字典参数中获取源图片
        UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
        // 将源图片显示在界面上
        self.imageView.image = image;
        // 如果图片选取器的源类型为摄像头
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            // 将照片存入系统相册
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        }
        [self saveAndUploadImage:image]; // 保存并上传文件
    } else if([mediaType isEqualToString:(NSString *)kUTTypeMovie]){// 如果媒体类型为视频
        // 从info字典参数中获取视频的url地址
        id url = info[UIImagePickerControllerMediaURL];
        NSLog(@"url:%@",url);
        // 实例化视频播放器，然后播放视频
        if(self.moviePlayerController == nil){
            self.moviePlayerController = [[MPMoviePlayerController alloc]init];
            self.moviePlayerController.view.frame = self.videoview.frame;
            self.moviePlayerController.controlStyle = MPMovieControlStyleEmbedded;// 嵌入
            [self.view addSubview:self.moviePlayerController.view];
        }
        //设置手机相册中的视频地址
        
        self.moviePlayerController.contentURL = url;
        //开始播放视频
        
        [self.moviePlayerController play];
        // 如果图片选取器的源类型为摄像头
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            
            // 将视频存入系统相册
            ALAssetsLibrary *al = [[ALAssetsLibrary alloc]init];
            [al writeVideoAtPathToSavedPhotosAlbum:url completionBlock:nil];
        }
    }
    // 关闭图片选取器控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveAndUploadImage:(UIImage *)image {
    // 裁剪图片
    image = [self scaleImage:image toSize:CGSizeMake(295, 412)];
    // 创建要上传的image的data对象
    NSData *imageData = UIImagePNGRepresentation(image);
    // 把imgageData写入沙盒文件中
    NSString *fullFilePath = [self getFilePath];
    [imageData writeToFile:fullFilePath atomically:YES];
    // 创建ASIFormDataRequest对象
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:UPLOADURL]];
    // 模拟web应用form表单提交上传文件
    //[request setData:imageData forKey:nil];
    [request setFile:fullFilePath forKey:@"fileName"];
    // 指定委托
    [request setDelegate:self];
    // 发送异步请求
    [request startAsynchronous];
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    activityIndicator.center = self.view.center;
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.hidden = NO;
    [activityIndicator startAnimating];
    [self.view addSubview:activityIndicator];
    // 处理结果
    [request setCompletionBlock:^{
        [self myAlert:@"骚年！上传成功了！"];
        // 停止并隐藏进度轮
        [activityIndicator stopAnimating];
        activityIndicator.hidden = YES;
        // 删除沙盒中文件
        [self deleteFile:fullFilePath];
    }];
}

#pragma mark 在图片选取器点击取消时回调的委托方法
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    // 关闭图片选取器控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}
// 自定义提示框
- (void)myAlert:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];
}
//剪裁图片
- (UIImage *)scaleImage:(UIImage *)img toSize:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}
// 获取文件路径
- (NSString *)getFilePath {
    static int i = 0;
    i++;
    NSString *fileName = [NSString stringWithFormat:@"img%d.png",i];
    // 获取沙盒中documents目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = paths[0];
    NSLog(@"filePath:%@",[docPath stringByAppendingPathComponent:fileName]);
    return [docPath stringByAppendingPathComponent:fileName];
}
// 删除文件
- (void)deleteFile:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:filePath error:nil];
}
@end
