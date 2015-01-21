//
//  ProvincesViewController.m
//  UI-Test
//
//  Created by 闫潇 on 15/1/19.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ProvincesViewController.h"
#import "CitiesViewController.h"
#import "MyHeaderFile.h"

@interface ProvincesViewController ()
@property (nonatomic,strong) CitiesViewController * cityVC;
@end

@implementation ProvincesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"省份";
    [self getProvince];
}
#pragma mark 获取省份数据
-(void)getProvince
{
    //获取URL
    NSString * urlStr = [NSString stringWithFormat:@"%@%@&country=%@",ProvinceURL,PassID,[self.countiesDic allKeys][0]];
    NSURL * url = [NSURL URLWithString:urlStr];
    //发送request请求
    NSURLRequest * request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    
    //使用代码块方法获取数据
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError)
        {
            //如果失败
            [self myAlert:[connectionError localizedDescription]];
        }
        else
        {
            // 把返回的data解析成数组
            NSError * error = nil;
            self.provinceArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            if (error)
            {
                [self myAlert:[error localizedDescription]];
            }
            else
            {
                //在主线程中更新UI
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        }
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.provinceArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellID =@"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    NSDictionary * provinceDic = self.provinceArr[indexPath.row];
    
    NSString * provinceID = provinceDic[[provinceDic allKeys][0]];
    
    NSString * provinceName = provinceDic[provinceID];
    
    cell.textLabel.text = provinceName;
    cell.detailTextLabel.text = provinceID;
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
#pragma mark 点击单元格进入下一视图
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.cityVC)
    {
        self.cityVC = [self.storyboard instantiateViewControllerWithIdentifier:@"cityVC"];
    }
    
    self.cityVC.provinceDic=self.provinceArr[indexPath.row];
    
    [self.navigationController pushViewController:self.cityVC animated:YES];
    
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
