//
//  RotViewController.m
//  UI-app-test2
//
//  Created by 闫潇 on 15/1/17.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "RootViewController.h"
#import "WeiboDate.h"
#define KWeiboURL @"https://api.weibo.com/2/statuses/public_timeline.json"
#define URLPass @"?access_token=2.00lnmhZFfC4SKD500ff8c7b3efduoD&count=100"

@interface RootViewController ()
@property (nonatomic,strong) NSArray * weiboList;//微博数据
@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    NSString * bundle = [[NSBundle mainBundle]pathForResource:@"info" ofType:@"plist"];
    
    NSLog(@"%@",bundle);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)refreshControl:(id)sender
{
    [self.refreshControl beginRefreshing];
    [self getWeibo];
    [self.refreshControl endRefreshing];
    
}

-(void)getWeibo
{
    //创建URL
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",KWeiboURL,URLPass];
    
    NSURL * url = [NSURL URLWithString:urlStr];
    
    //发送request请求
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    
    //代码块方法发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError)
        {
            [self myAlert:[connectionError localizedDescription]];
        }
        else
        {
            //获取微博列表
            NSError * error = nil;
            NSDictionary * weiboDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            self.weiboList=weiboDic[@"statuses"];
            
            if (error)
            {
                [self myAlert:[error localizedDescription]];
            }
            else
            {
                dispatch_async(
                               dispatch_get_main_queue(), ^
                {
                    [self.tableView reloadData];
                });
            }
        }
    }];
}
-(void)myAlert:(NSString *)error
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:error delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return self.weiboList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    //获取发微博人昵称
    //1、首先获取微博列表内的微博字典
    NSDictionary *weiboDict = self.weiboList[indexPath.row];
    //2、然后获取微博字典内的发微博人字典
    NSDictionary *userDict = weiboDict[@"user"];
    //3、最后获取发微博人昵称
    NSString *nickName = userDict[@"name"];

    UILabel * nickNameLabel = (UILabel *)[tableView viewWithTag:1];
    nickNameLabel.text = nickName;

    //4、发微博时间
    NSString *weiboDateStr = weiboDict[@"created_at"];
    NSLog(@"weiboDateStr:%@",weiboDateStr);
    
    UILabel *weiboDateLabel = (UILabel *)[tableView viewWithTag:2];
    weiboDateLabel.text = [WeiboDate resolveSinaWeiboDate:weiboDateStr];
    //5、微博正文
    NSString *weiboText = weiboDict[@"text"];
    UILabel *weiboTextLabel = (UILabel *)[tableView viewWithTag:333];
    weiboTextLabel.text = weiboText;
    //微博图片（如果有）
    
    if ([[weiboDict allKeys] containsObject:@"thumbnail_pic"])
    {
        //创建微博图片地址
        NSString *weiboImageUrl = weiboDict[@"thumbnail_pic"];
//        NSLog(@"%@发的微博有图片！图片地址：%@",nickName,weiboImageUrl);
        
        NSURL *url = [NSURL URLWithString:weiboImageUrl];
        //通过url地址同步下载图片（会导致UI卡顿）
                NSData *imageData = [NSData dataWithContentsOfURL:url];
                UIImage *weiboImage = [UIImage imageWithData:imageData];
        //获取界面单元格中imageView
        UIImageView *weiboImageView = (UIImageView *)[tableView viewWithTag:3];
//        //使用AFNetworking中imageView的类目异步下载图片（带缓存）
//        [weiboImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar.jpg"]];
                weiboImageView.image = weiboImage;
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
