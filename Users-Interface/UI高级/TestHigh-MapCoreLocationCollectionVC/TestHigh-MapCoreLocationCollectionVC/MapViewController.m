//
//  MapViewController.m
//  TestHigh-MapCoreLocationCollectionVC
//
//  Created by ibokan on 15/1/28.
//  Copyright (c) 2015年 杨晋枝. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@property (strong, nonatomic) MKMapView *mapView;// 地图视图

@end

@implementation MapViewController

#pragma mark 视图加载成功时
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"地图";
    // 创建地图视图
    _mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    CGRect mapViewFrame = _mapView.frame;
    mapViewFrame.size.height -= 50;
    _mapView.frame = mapViewFrame;
    // 指定委托
    _mapView.delegate = self;
    // 加入view中
    [self.view addSubview:_mapView];
}

#pragma mark 视图出现时动画显示地图
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 创建地图显示区域
    MKCoordinateRegion region;
    // 指定显示区域中心点
    region.center.latitude = _location.coordinate.latitude;
    region.center.longitude = _location.coordinate.longitude;
    // 指定显示区域范围(111米之内)
    region.span.latitudeDelta = 0.001;
    region.span.longitudeDelta = 0.001;
    // 设置地图显示范围
    [_mapView setRegion:region animated:YES];
}

#pragma mark 显示当前位置
- (IBAction)showUserLocation:(id)sender {
    _mapView.showsUserLocation = YES;// 必须用户允许访问位置信息才有效
}

#pragma mark 改变地图显示类型
- (IBAction)mapTypeChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            _mapView.mapType = MKMapTypeStandard;// 标准
            break;
        case 1:
            _mapView.mapType = MKMapTypeHybrid;// 鸟瞰
            break;
        case 2:
            _mapView.mapType = MKMapTypeSatellite;// 卫星
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
