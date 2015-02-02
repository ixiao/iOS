//
//  MapViewController.m
//  TestHigh-MapCoreLocationCollectionVC
//
//  Created by ibokan on 15/1/28.
//  Copyright (c) 2015年 杨晋枝. All rights reserved.
//

#import "MapViewController.h"
#import "Map-Annotation.h"
#import "AboutViewController.h"
@interface MapViewController ()

@property (strong, nonatomic) MKMapView *mapView;// 地图视图
@property (nonatomic,strong) AboutViewController * aboutVC;
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
    
    
    //添加右导航按钮
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAnnotation)];
    self.navigationItem.rightBarButtonItem=barBtn;
}
#pragma mark 给地图添加自定义图钉
-(void)addAnnotation
{
    //创建自定义图钉对象
    Map_Annotation * myAnnotation = [Map_Annotation new];
    //指定坐标
    myAnnotation.coordinate=_location.coordinate;
    
    //指定主标题
    myAnnotation.title=@"石景山区总工会";
    //指定子标题
    myAnnotation.subtitle=@"博看文思";
    
    //添加到地图上
    [_mapView addAnnotation:myAnnotation];
}
#pragma mark 配置自定义图钉视图 委托方法
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //声明出列可重用标志符
    static NSString * viewID =@"view";
    //首先从处理可重用队列中获取标注视图
    MKAnnotationView * annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:viewID];
    if (!annotationView)
    {
        annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:viewID];
    }
    
    //指定标注视图能够呼出
    annotationView.canShowCallout=YES;
    //指定图钉图片
    annotationView.image=[UIImage imageNamed:@"pushpin9"];
    //自定义图钉中呼出视图中左右视图
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    leftButton.frame = CGRectMake(0, 0, 35, 35);
    [leftButton setImage:[UIImage imageNamed:@"pushpin7"] forState:UIControlStateNormal];
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    leftButton.frame = CGRectMake(0, 0, 35, 35);
    //给两个自定义按钮添加方法
    [leftButton addTarget:self action:@selector(gotoAboutUSVC) forControlEvents:UIControlEventTouchUpInside];
    [rightButton addTarget:self action:@selector(gotoAboutUSVC) forControlEvents:UIControlEventTouchUpInside];
    //添加到自定义图钉呼出视图中
    annotationView.leftCalloutAccessoryView=leftButton;
    annotationView.rightCalloutAccessoryView=rightButton;
    
    
    return annotationView;
}

#pragma mark 跳到关于我们视图控制器
-(void)gotoAboutUSVC
{
    if (!self.aboutVC)
    {
        self.aboutVC=[self.storyboard instantiateViewControllerWithIdentifier:@"aboutVC"];
    }
    
    [self.navigationController showViewController:self.aboutVC sender:self];
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
