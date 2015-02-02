//
//  MainViewController.m
//  UITesting
//
//  Created by 何瑾 on 14-9-14.
//  Copyright (c) 2014年 e世雕龙. All rights reserved.
//

#import "MainViewController.h"
#import "config.h"
#import "SinaWeiboDate.h"
#import "UIImageView+AFNetworking.h"

@interface MainViewController ()

@property (strong, nonatomic) NSArray *weiboList;//微博列表

@end

@implementation MainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //获取微博列表
    [self getWeibo];
}
#pragma mark 获取微博列表
- (void)getWeibo {
    //创建URL
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kWeiboURL,@"?access_token=2.00lnmhZFfC4SKD500ff8c7b3efduoD&count=100"];
    NSURL *url = [NSURL URLWithString:urlStr];
    //创建request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //代码块方式发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //获取微博列表
        __autoreleasing NSError *error = nil;
        NSDictionary *weiboDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        self.weiboList = weiboDict[kWeibo];
        if (error) {
            NSLog(@"error:%@",[error localizedDescription]);
        } else {
            //在主线程中刷新UI（刷新表视图）
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.weiboList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建出列可重用标识符
    static NSString *cellID = @"cellID";
    //从出列可重用队列中获取单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    //如果没有则创建
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    // Configure the cell...
    //获取发微博人昵称
    //1、首先获取微博列表内的微博字典
    NSDictionary *weiboDict = self.weiboList[indexPath.row];
    //2、然后获取微博字典内的发微博人字典
    NSDictionary *userDict = weiboDict[kWeiboUser];
    //3、最后获取发微博人昵称
    NSString *nickName = userDict[kWeiboUserName];
    UILabel *nickNameLabel = (UILabel *)[tableView viewWithTag:101];
    nickNameLabel.text = nickName;
    //4、发微博时间
    NSString *weiboDateStr = weiboDict[kWeiboDate];
    NSLog(@"weiboDateStr:%@",weiboDateStr);
    UILabel *weiboDateLabel = (UILabel *)[tableView viewWithTag:102];
    weiboDateLabel.text = [SinaWeiboDate resolveSinaWeiboDate:weiboDateStr];
    //微博正文
    NSString *weiboContent = weiboDict[kWeiboText];
    UILabel *weiboContentLabel = (UILabel *)[tableView viewWithTag:103];
    weiboContentLabel.text = weiboContent;
    //微博图片（如果有）
    if ([[weiboDict allKeys] containsObject:kWeiboImage]) {
        NSString *weiboImageUrl = weiboDict[kWeiboImage];
        NSLog(@"%@发的微博有图片！图片地址：%@",nickName,weiboImageUrl);
        NSURL *url = [NSURL URLWithString:weiboImageUrl];
        //通过url地址同步下载图片（会导致UI卡顿）
//        NSData *imageData = [NSData dataWithContentsOfURL:url];
//        UIImage *weiboImage = [UIImage imageWithData:imageData];
        //获取界面单元格中imageView
        UIImageView *weiboImageView = (UIImageView *)[tableView viewWithTag:104];
        //使用AFNetworking中imageView的类目异步下载图片（带缓存）
        [weiboImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar.jpg"]];
//        weiboImageView.image = weiboImage;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
