//
//  RootViewController.m
//  UI-Test
//
//  Created by 闫潇 on 15/1/19.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "CountryViewController.h"
#import "ProvincesViewController.h"
#import "AFNetworking.h"
#import "MMProgressHUD.h"

@interface CountryViewController ()
@property (nonatomic,strong) NSArray * counties;//国家数组
@property (nonatomic,strong) ProvincesViewController * provinceVC;
@end

@implementation CountryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"国家";
    
}
#pragma mark 发送网络请求获取国家列表(使用AFNetWorking)
-(void)getCountiesbyAFNetWork
{
    //创建活动指示器
    [MMProgressHUD showWithTitle:@"加载数据" status:@"加载中..."];
    
    // 创建AFNetworking的http请求操作管理器
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager new];
    
    NSDictionary * parments= @{@"access_token":@"2.00ZtlF5C0GvJSM28ba1329cb6CdARD",@"language":@"zh-tw"};
    
    
    //创建http请求操作对象
    AFHTTPRequestOperation * op = [manager GET:@"https://api.weibo.com/2/common/get_country.json" parameters:parments success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.counties = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error)
        {
            [MMProgressHUD dismissWithError:[NSString stringWithFormat:@"数据加载失败:%@",[error localizedDescription]] title:@"加载失败"];
            NSLog(@"%@",[error localizedDescription]);
        }
        //加载成功关闭活动指示器
        [MMProgressHUD dismissWithSuccess:@"您久等了！" title:@"加载成功"];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        
        });
    }];
    
    [op start];
}
#pragma mark 获取国家数据方法
//-(void)getCounties
//{
////    // 创建AFNetworking的http请求操作管理器
////    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager new];
////    
////    NSDictionary * parments= @{@"access_token":@"2.00ZtlF5C0GvJSM28ba1329cb6CdARD",@"language":@"zh-tw"};
////    
////    
////    //创建http请求操作对象
////    AFHTTPRequestOperation * op = [manager GET:@"https://api.weibo.com/2/common/get_country.json" parameters:parments success:^(AFHTTPRequestOperation *operation, id responseObject) {
////        self.counties = responseObject;
////    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////        dispatch_async(dispatch_get_main_queue(), ^{
////            [self.tableView reloadData];
////            NSLog(@"%@",[error localizedDescription]);
////        });
////        
////    }];
////    
////    [op start];
//    
//    //获取URL
//    NSString * urlStr = [NSString stringWithFormat:@"%@%@",CountriesURL,PassID];
//    NSURL * url = [NSURL URLWithString:urlStr];
//    //发送request请求
//    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
//    
//    //使用代码块方法获取数据
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if (connectionError)
//        {
//            //如果失败
//            [self myAlert:[connectionError localizedDescription]];
//        }
//        else
//        {
//            // 把返回的data解析成数组
//            NSError * error = nil;
//            self.counties = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//            
//            if (error)
//            {
//                [self myAlert:[error localizedDescription]];
//            }
//            else
//            {
//                //在主线程中更新UI
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self.tableView reloadData];
//                });
//            }
//        }
//    }];
//}
#pragma mark 下拉刷新方法
- (IBAction)Refresh:(id)sender
{
    [self.refreshControl beginRefreshing];
    [self getCountiesbyAFNetWork];
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.counties.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    //1.从国家数组中获取国家字典
    NSDictionary * countryDic = self.counties[indexPath.row];
    //2.从国家字典中获取所有键
    NSString * countryID = countryDic[[countryDic allKeys][0]];
    //3.通过国家编码获取国家名称
    NSString * countryName = countryDic[countryID];
    
    cell.textLabel.text = countryName;
    cell.detailTextLabel.text = countryID;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}
#pragma mark 点击单元格进入下一视图的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.provinceVC)
    {
        self.provinceVC = [self.storyboard instantiateViewControllerWithIdentifier:@"provinceVC"];
    }
    
    self.provinceVC.countiesDic = self.counties[indexPath.row];
    [self.navigationController pushViewController:self.provinceVC animated:YES];
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
-(void)myAlert:(NSString *)msg
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
@end
