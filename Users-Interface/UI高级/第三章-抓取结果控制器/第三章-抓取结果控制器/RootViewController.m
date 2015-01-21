//
//  RootViewController.m
//  第三章-抓取结果控制器
//
//  Created by 闫潇 on 15/1/16.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "RootViewController.h"
#import "Student.h"
@interface RootViewController ()
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong)  NSFetchedResultsController *  fetchedResultsController;//托管对象上下文

@property (nonatomic,copy) NSString * name;
@property (nonatomic,assign) NSUInteger phoneNumber;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.获取应用程序对象(单例)
    UIApplication * app = [UIApplication sharedApplication];
    
    //2.获取应用程序委托
    id appDalegate = app.delegate;
    
    //3.获取托管对象上下文
    self.managedObjectContext=[appDalegate managedObjectContext];
    
    //4.创建抓去请求对象
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    //4.1创建排序规则
    NSSortDescriptor * sd1 = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    //4.2设置抓取请求的排序规则属性
    [request setSortDescriptors:@[sd1]];
    
    //5.抓去结果控制器(1.给表视图提供数据  2. 监控 CoreData数据变化)
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"stu"];
    
    //5.1 指定抓取结果控制器的委托，在CoreData中对象发生变化时 调用相关委托方法
    self.fetchedResultsController.delegate=self;
    
    //6.执行抓取
    __autoreleasing NSError * error = nil;
    [self.fetchedResultsController performFetch:&error];
    
    if (error)
    {
        [self myAlert:[error localizedDescription]];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark 通过  CoreData添加对象
- (IBAction)addObject:(id)sender {
    
    //通过实体描述类创建数据模型（托管对象）放入托管对象上下文中
    Student * stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
    //给数据模型（托管对象 属性绑定界面数据）
    static int i =0;
    i++;
    stu.name = [NSString stringWithFormat:@"潇%d",i];
    stu.phoneNumber = @1234567890;
    
    // 通过托管对象上下文保存数据模型（托管对象）
    __autoreleasing  NSError * error = nil;
    [self.managedObjectContext save:&error];
    //判断是否保存成功
    if (error)
    {
        [self myAlert:@"托管对象保存失败"];
    }
    else
    {
        [self myAlert:@"托管对象保存成功"];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    if ([[self.fetchedResultsController sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    } else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建可重用标志符
    static NSString * cellID = @"cell";
    //从出列可重用队列获取单元格
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    //如果没有则创建
    if (!cell)
    {
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    Student * stu = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text=stu.name;
    cell.detailTextLabel.text=[stu.phoneNumber stringValue];

    // Configure the cell with data from the managed object.
    return cell;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            //增加
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
//修改
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
            //增加
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
            //删除
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            //修改
        case NSFetchedResultsChangeUpdate:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
//通知tableView数据变化结束，开始进行UI刷新

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}
    //- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // 只需删除CoreData中对象
        //从CoreData中获取模型对象
        Student * stu = [self.fetchedResultsController objectAtIndexPath:indexPath];
        //从CoreData的托管对象上下文中删除对象
        [self.managedObjectContext deleteObject:stu];
        //保存上下文
        __autoreleasing NSError * error =nil;
        [self.managedObjectContext save:&error];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
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
#pragma mark Table view deledate
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
#pragma mark 封装UIAlertView
- (void)myAlert:(NSString *)errorMsg {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"信息" message:errorMsg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}
@end
