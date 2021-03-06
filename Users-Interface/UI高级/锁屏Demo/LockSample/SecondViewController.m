//
//  SecondViewController.m
//  LockSample
//
//  Created by Lugede on 14/11/11.
//  Copyright (c) 2014年 lugede.cn All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

#define kLableArray @[@"创建密码", @"修改密码", @"清除密码"]

@interface SecondViewController ()
{
    NSArray* heightArray;
}
@property (weak, nonatomic) IBOutlet UITableView *settingTableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([LLLockPassword loadLockPassword]) {
        heightArray = @[@"0.0", @"50.0", @"50.0"];
    } else {
        heightArray = @[@"50.0", @"0.0", @"0.0"];
    }
    [self.settingTableView reloadData]; // ios6需要不然不刷新，8不要，7未验证
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((NSNumber*)(heightArray[indexPath.row])).floatValue;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* ident = @"SettingCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    cell.textLabel.text = kLableArray[indexPath.row];
    cell.clipsToBounds = YES;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AppDelegate* ad = (AppDelegate*)[UIApplication sharedApplication].delegate;
    switch (indexPath.row) {
        case 0:
            [ad showLLLockViewController:LLLockViewTypeCreate];
            break;
        case 1:
            [ad showLLLockViewController:LLLockViewTypeModify];
            break;
        default:
            [ad showLLLockViewController:LLLockViewTypeClean];
            break;
    }
}


@end
