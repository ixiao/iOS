//
//  ViewController.m
//  By-AFNet-下载图片
//
//  Created by 闫潇 on 15/1/20.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "MMProgressHUD.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) UIImagePickerController * imagePickerController;//图像选取器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //给图像视图添加轻拍手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)];
    //设置手势属性，一个手指单击一次
    tap.numberOfTapsRequired=1;
    tap.numberOfTouchesRequired=1;
    //给界面图像视图绑定手势
    [self.imageView addGestureRecognizer:tap];
    //设置图像视图可以与用户交互
    self.imageView.userInteractionEnabled=YES;
    //初始化图像选取控制器
    self.imagePickerController = [UIImagePickerController new];
    
    //设置图像选取器的委托
    self.imagePickerController.delegate=self;
}
#pragma mark 上传图片 AFNetWorking
- (IBAction)upLodadImage:(id)sender
{

    // 把图片对象转换成data对象（UIImagePNGRepresentation方法 C语言）
    NSData * imageData = UIImagePNGRepresentation(self.imageView.image);
    // 保存图片到沙盒中（获取文件完整目录，使用data对象的writeToFile:atomically:方法写入）
    NSString * filePath = [self getFilePath:@"002.png"];
    [imageData writeToFile:filePath atomically:YES];
    // 使用AFNetworking上传图片
    // 创建http请求操作管理器（AFHTTPRequestOperationManager类的对象）
    AFHTTPSessionManager * manager = [AFHTTPSessionManager new];
    // 设置接收响应类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    // 使用AFHTTPRequestOperationManager类的对象POST:parameters: constructingBodyWithBlock: success: failure:方法创建http请求操作对象(AFHTTPRequestOperation)
    AFHTTPRequestOperation * op = [manager POST:@"http://edutohome.sinaapp.com/pages/admin/upload/upload.php" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
#pragma mark    文件路径方式上传图片
        // 通过沙盒中文件完整路径创建NSURL对象（NSURL 的类方法fileURLWithPath:）
        NSURL * fileURL = [NSURL fileURLWithPath:filePath];
        // 调用代码块的formData参数的appendPartWithFileURL: name:error:方法上传图片（注意此处name参数是服务端上传图片时接口中的参数名称）
        NSError * error = nil;
    [formData appendPartWithFileURL:fileURL name:@"fileName" error:&error];
        // data方式上传图片
        
        //打开活动指示器
        [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleFade];
        [MMProgressHUD showWithStatus:@"上传图片中"];
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        [MMProgressHUD dismissWithSuccess:@"上传成功"];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [MMProgressHUD dismissWithError:@"上传失败"];
    }];
    [op start];

 

};
//// 使用AFNetworking上传图片
//// 创建http请求操作管理器（AFHTTPRequestOperationManager类的对象）
//AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager new];
//// 设置接收响应类型
//manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
//// 使用AFHTTPRequestOperationManager类的对象POST:parameters: constructingBodyWithBlock: success: failure:方法创建http请求操作对象(AFHTTPRequestOperation)
//AFHTTPRequestOperation *op=[manager POST:@"http://edutohome.sinaapp.com/pages/admin/upload/upload.php" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    //    constructingBodyWithBlock代码块参数中执行以下代码：
//    // 文件路径方式上传图片

//    // 通过沙盒中文件完整路径创建NSURL对象（NSURL 的类方法fileURLWithPath:）
//    NSURL *fileUrl=[NSURL fileURLWithPath:filePath];
//    // 调用代码块的formData参数的appendPartWithFileURL: name:error:方法上传图片（注意此处name参数是服务端上传图片时接口中的参数名称）
//    __autoreleasing NSError *error=nil;
//    [formData appendPartWithFileURL:fileUrl name:@"fileName" error:&error];
//    // data方式上传图片
//    /*[formData appendPartWithFileData:imageData name:@"fileName" fileName:@"upload.png" mimeType:@"image/png"];*/
//    //打开活动指示器
//    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleFade];
//    [MMProgressHUD showWithStatus:@"上传图片中..."];
//    
//} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    [MMProgressHUD dismissWithSuccess:@"上传成功！"];
//} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    [MMProgressHUD dismissWithError:@"上传失败！"];
//}];
//
////  最后http请求操作对象发送请求
//[op start];
//


#pragma mark 轻击图片打开图像选取器,从相册中选取图片
-(void)tapImage:(UITapGestureRecognizer *)recognizer
{
    //打开图片库选取图片
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}
#pragma mark 图片选取器回调的委托方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //从info字典参数中获取选中的图片(通过UIImagePickerControllerOriginalImage键获取)
    UIImage * image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image=image;
    //关闭图片库
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 获取文件路径
- (NSString *)getFilePath:(NSString *)fileName {
    // 获取documents目录
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = docPaths[0];
    NSString *filePath = [docPath stringByAppendingPathComponent:fileName];
    return filePath;
}

@end
