//
//  RootViewControl.m
//  第六章-自定义单元格-code
//
//  Created by 闫潇 on 14/12/31.
//  Copyright (c) 2014年 yan. All rights reserved.
//

#import "RootViewControl.h"
#import "MyCell.h"
@interface RootViewControl ()
@property(strong,nonatomic)NSArray *students;
@end

@implementation RootViewControl

- (void)awakeFromNib {
    Student * stu1 = [[Student alloc] initWithName:@"孙悟空" andNickname:@"猴子" andIcon:[UIImage imageNamed:@"monkey.png"]];
    Student * stu2 = [[Student alloc] initWithName:@"猪八戒" andNickname:@"呆子" andIcon:[UIImage imageNamed:@"pig.png"]];
    Student * stu3 = [[Student alloc] initWithName:@"白龙马" andNickname:@"小白" andIcon:[UIImage imageNamed:@"horse.png"]];
    Student * stu4 = [[Student alloc] initWithName:@"沙和尚" andNickname:@"二师兄" andIcon:[UIImage imageNamed:@"ghost.png"]];
    Student * stu5 = [[Student alloc] initWithName:@"唐三藏" andNickname:@"唐哥哥" andIcon:[UIImage imageNamed:@"tang.png"]];
    Student * stu6 = [[Student alloc] initWithName:@"何瑾" andNickname:@"老何" andIcon:[UIImage imageNamed:@"hejin.png"]];
    Student * stu7 = [[Student alloc] initWithName:@"白骨精" andNickname:@"小白" andIcon:[UIImage imageNamed:@"whiteBoneDemon.png"]];
    Student * stu8 = [[Student alloc] initWithName:@"关颂" andNickname:@"关二爷" andIcon:[UIImage imageNamed:@"guan.png"]];
    self.students = [NSArray arrayWithObjects:stu1, stu2, stu3, stu4, stu5, stu6, stu7, stu8, nil];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

#pragma mark - Table view data source
//次数据源方法指定数据源有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//次数据源方法指定有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.students.count;
}

//次数据源方法指定表视图如何展示单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID=@"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    //从数据源中获取学生对象
    Student *stu=self.students[indexPath.row];
    //    cell.myImageView.image=stu.icon;
    //    cell.name.text=stu.name;
    //    cell.nikeName.text=stu.nickname;
    if (!cell)
    {
        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    // Configure the cell...
    
    return cell;
}

    // Initialization code


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
