//
//  ViewController.m
//  TestHigh-MapCoreLocationCollectionVC
//
//  Created by ibokan on 15/1/28.
//  Copyright (c) 2015年 杨晋枝. All rights reserved.
//

#import "LocationViewController.h"
#import "MapViewController.h"

@interface LocationViewController ()

@property (strong, nonatomic) IBOutlet UILabel *lblLongitude;// 经度
@property (strong, nonatomic) IBOutlet UILabel *lblLatitude;// 纬度
@property (strong, nonatomic) IBOutlet UILabel *lblAltitude;// 海拔高度
@property (strong, nonatomic) CLLocationManager *locationManager;// 位置管理器
@property (strong, nonatomic) CLLocation *location;// 位置对象
@property (strong, nonatomic) MapViewController *mapVC;// 地图视图

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建位置管理器
    [self createLocationManager];
}

#pragma mark 创建位置管理器
- (void)createLocationManager
{
    // 初始化位置管理器
    _locationManager = [CLLocationManager new];
    // 指定委托
    _locationManager.delegate = self;
    // 指定期望精度
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // 指定筛选距离（就是你的设备每移动多少米刷新位置信息）
    _locationManager.distanceFilter = 1000;
    // 指定始终允许用户访问位置信息
    [_locationManager requestAlwaysAuthorization];
    // 启动位置管理器(开始回调委托方法)
    [_locationManager startUpdatingLocation];
}

#pragma mark 显示地图
- (IBAction)showMapBtn:(id)sender {
    // 地图视图如果没有则创建
    if (!self.mapVC) {
        // 从storyboard中获取地图视图控制器
        self.mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mapVC"];
    }
    
    // 传值
    self.mapVC.location = _location;
    // 页面跳转
    [self.navigationController showViewController:self.mapVC sender:self];
}


#pragma mark -CLLocationManagerDelegate
// 此委托方法是更新位置信息
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // 获取当前位置对象（数组最后一个元素就是）
    _location = [locations lastObject];
    //从当前位置中获取经纬度、水平精准度、海拔、海拔精准度
    //%g如果没有指明精度，则只会给出6个数字，而且会四舍五入
    //Unicode编码“\u00B0”表示“°”
    // 更新界面
    self.lblLongitude.text = [NSString stringWithFormat:@"%g\u00B0", _location.coordinate.longitude];
    self.lblLatitude.text = [NSString stringWithFormat:@"%g\u00B0", _location.coordinate.latitude];
    self.lblAltitude.text = [NSString stringWithFormat:@"%g千米", _location.altitude];
}

// 位置信息访问权限发生改变时回调
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [_locationManager requestWhenInUseAuthorization];
            }
            break;
            
        default:
            break;
    }
}

// 此委托方法是获取用户位置数据失败回调的方法，在此通知用户
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorDenied) {
        // 访问被拒绝
        [self myAlert:@"访问被拒绝"];
    }
    
    if ([error code] == kCLErrorLocationUnknown) {
        // 无法获取位置信息
        [self myAlert:@"无法获取位置信息"];
    }
}

#pragma mark 封装UIAlertView
- (void)myAlert:(NSString *)errorMsg {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"信息" message:errorMsg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
