//
//  mainViewController.m
//  第六章-自定义单元格
//
//  Created by 闫潇 on 14/12/31.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "mainViewController.h"
#import "Student.h"
#import "MycellTableViewCell.h"
@interface mainViewController ()
@property (nonatomic,strong) NSArray * students;//学生数组数据源
@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Student * stu1 = [[Student alloc] initWithName:@"孙悟空" andNickname:@"猴子" andIcon:[UIImage imageNamed:@"monkey.png"]];
    Student * stu2 = [[Student alloc] initWithName:@"猪八戒" andNickname:@"呆子" andIcon:[UIImage imageNamed:@"pig.png"]];
    Student * stu3 = [[Student alloc] initWithName:@"白龙马" andNickname:@"小白" andIcon:[UIImage imageNamed:@"horse.png"]];
    Student * stu4 = [[Student alloc] initWithName:@"沙和尚" andNickname:@"二师兄" andIcon:[UIImage imageNamed:@"ghost.png"]];
    Student * stu5 = [[Student alloc] initWithName:@"唐三藏" andNickname:@"唐哥哥" andIcon:[UIImage imageNamed:@"tang.png"]];
    Student * stu6 = [[Student alloc] initWithName:@"何瑾" andNickname:@"老何" andIcon:[UIImage imageNamed:@"hejin.png"]];
    Student * stu7 = [[Student alloc] initWithName:@"白骨精" andNickname:@"小白" andIcon:[UIImage imageNamed:@"whiteBoneDemon.png"]];
    Student * stu8 = [[Student alloc] initWithName:@"关颂" andNickname:@"关二爷" andIcon:[UIImage imageNamed:@"guan.png"]];
//    self.students = [NSArray arrayWithObjects:stu1, stu2, stu3, stu4, stu5, stu6, stu7, stu8, nil];
    self.students = @[stu1, stu2, stu3, stu4, stu5, stu6, stu7, stu8];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//此数据源方法指定表视图有几个分区

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}


//此数据源方法指定每行分区有几个数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

//此数据源方法指定表视图如何展示数据(生成单元格)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //声明出列可重用队列
    static NSString * cellID  = @"cellID";
    //从出列可重用队列中获取单元格
    
    MycellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    //配置单元格
    Student * student = self.students[indexPath.row];
    
    cell.imageView.image = student.icon;
    cell.niName.text=student.nickname;
    cell.name.text=student.name;
    // Configure the cell...
    
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
