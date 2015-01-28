//
//  MapViewController.h
//  TestHigh-MapCoreLocationCollectionVC
//
//  Created by ibokan on 15/1/28.
//  Copyright (c) 2015年 杨晋枝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) CLLocation *location;// 需要穿过来的位置

@end
