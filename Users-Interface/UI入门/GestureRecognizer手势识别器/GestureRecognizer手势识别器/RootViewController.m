//
//  RootViewController.m
//  GestureRecognizer手势识别器
//
//  Created by ibokan on 15/1/12.
//  Copyright (c) 2015年 @慕辰. All rights reserved.
//

#import "RootViewController.h"
#import "SwipeDetationController.h"
#import "SwipeViewController.h"
#import "TapViewController.h"
#import "ImgViewController.h"
#import "RouViewController.h"
#import "PanViewController.h"
#import "LongPressViewController.h"
#import "AddViewController.h"
@interface RootViewController ()

@property (strong, nonatomic) NSArray *viewControllers;// 保存视图控制器的数组

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle * bun = [NSBundle mainBundle];
    NSLog(@"%@",bun);
    
    // 准备数据源
    SwipeDetationController *swipeDetectionController = [self.storyboard instantiateViewControllerWithIdentifier:@"mVC"];
    swipeDetectionController.title = @"检测扫动";
    
    SwipeViewController *swipeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"swipeVC"];
    swipeVC.title = @"扫动手势识别器";
    
    TapViewController *tapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"tapVC"];
    tapVC.title = @"轻拍手势识别器";
    
    ImgViewController * imgVC = [self.storyboard instantiateViewControllerWithIdentifier:@"pinchVC"];
    imgVC.title = @"捏合手势识别器";
    
    RouViewController * rouVC = [self.storyboard instantiateViewControllerWithIdentifier:@"rouVC"];
    rouVC.title =@"旋转手势识别器";
    
    PanViewController * panVC = [self.storyboard instantiateViewControllerWithIdentifier:@"panVC"];
    panVC.title =@"拖动手势识别器";
    
    LongPressViewController * longPVC = [self.storyboard instantiateViewControllerWithIdentifier:@"longPressVC"];
    longPVC.title = @"长按手势识别器";
    
    AddViewController * addVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addVC"];
    addVC.title=@"混合双打";
    
    self.viewControllers = @[swipeDetectionController,swipeVC,tapVC,imgVC,rouVC,panVC,longPVC,addVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// 此数据源方法制定表视图有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
// 此数据源方法制定表视图的每个分区有几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.viewControllers.count;
}
// 此数据源方法指定表视图如何展示数据

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建出列可重用标识符
    static NSString *cellIdentifity = @"cellID";
    // 从出列可重用队列中获取单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifity];
    // 如果没有则创建
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifity];
    }
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.viewControllers[indexPath.row]title];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
//    id viewController = [segue destinationViewController];
    // Pass the selected object to the new view controller.
    
}
#pragma mark tableView delegate
// 此数据源方法在单击单元格某一行是调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取视图控制器数组中的视图控制器
    UIViewController *controller = self.viewControllers[indexPath.row];
    // 导航到视图控制器
    [self.navigationController pushViewController:controller animated:YES];
}


@end
