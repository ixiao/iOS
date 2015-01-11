//
//  rootViewController.m
//  Block  PassValue
//
//  Created by Fan Tengfei on 15/1/4.
//  Copyright (c) 2015年 Fan Tengfei. All rights reserved.
//

#import "rootViewController.h"
#import "modalViewController.h"

@interface rootViewController ()
@property(strong,nonatomic)NSMutableArray *list;  //数据源

@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.list=[NSMutableArray new];
    for (int i=0; i<20; i++) {
        NSString *name=[NSString stringWithFormat:@"fanfan %d",i+1];
        [self.list addObject:name];
    }
    NSLog(@"list:%@",self.list);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return self.list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID=@"cellID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    // Configure the cell...
    cell.textLabel.text=self.list[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
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

#pragma mark 次委托方法再点击表视图某一行时调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //首先获取单元格上文本内容
    NSString *name=self.list[indexPath.row];
    //通过代码块方式传递给modalViewController
    modalViewController *modalVC=[self.storyboard instantiateViewControllerWithIdentifier:@"modalVC"];
    
    [modalVC initWithBlock:^(NSString *name) {
        //根据回传回来的参数修改数据源
        [self.list replaceObjectAtIndex:indexPath.row withObject:name];
        //更新表视图
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    
    //属性传值
    modalVC.name=name;
    //弹出模态视图
    [self presentViewController:modalVC animated:YES completion:nil];
    
    
    
    
}











@end
