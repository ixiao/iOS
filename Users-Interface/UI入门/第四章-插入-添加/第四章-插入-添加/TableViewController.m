//
//  TableViewController.m
//  第四章-插入-添加
//
//  Created by 闫潇 on 14/12/30.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
@protocol TableViewControllerDelegate;
@interface TableViewController ()

//@property (strong, nonatomic) NSMutableArray *list;//数据源
@property (nonatomic,strong) ViewController * VC;
@property (nonatomic,strong) id<TableViewControllerDelegate>delegate;//委托对象
@end

@protocol TableViewControllerDelegate <NSObject>

-(void)moreName:(NSDictionary *)dic;


@end
@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //准备数据源
    self.list = [NSMutableArray new];
    for (int i=0; i<20; i++) {
        NSString *name = [NSString stringWithFormat:@"hejin%d",i+1];
        [self.list addObject:name];
    }
    NSLog(@"list:%@",self.list);
    
    //创建左导航按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleBordered target:self action:@selector(doEdit:)];
    //加入导航栏
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
}
#pragma mark doEdit
-(void)doEdit:(UIBarButtonItem *)sender
{
    //改变按钮文字
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title=@"完成";
    }else
    {
        sender.title=@"编辑";
    }
    //改变tableView的编辑状态(默认不可编辑)
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//此数据源方法指定表视图有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
//此数据源方法指定表视图每个分区有几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.list.count;
}
//此数据源方法指定表视图如何显示数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建可重用标识符
    static NSString *cellID = @"cellID";
    //首先从出列可重用队列中获取单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    //如果没有才创建单元格对象
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    // Configure the cell…
    //给单元格文本标签赋值
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

#pragma mark 此数据源方法提交编辑
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        static int i = 0;
        i++;
        NSString *str = [NSString stringWithFormat:@"新添加行%d",i];
        [self.list insertObject:str atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark 次委托方法在点击表视图某一行时回调
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //从storyboard中获取ViewController类的对象
    if (!self.VC)
    {
        self.VC=[self.storyboard instantiateViewControllerWithIdentifier:@"VC"];
//        self.VC = [self.storyboard.instantiateInitialViewController:@"VC"];
        
    }
    NSDictionary * dic = @{@"name":self.list[indexPath.row],@"indexPath":indexPath};
    //跳转模态视图
    self.VC.dic =dic;
    self.VC.delegate=self;
    //将要修改的数据传递给ViewController并跳转
}
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
#pragma mark 该委托方法指定默认的编辑类型（默认编辑类型时删除）
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleInsert;
}


@end
