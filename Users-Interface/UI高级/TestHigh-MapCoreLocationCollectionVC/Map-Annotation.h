//
//  Map-Annotation.h
//  TestHigh-MapCoreLocationCollectionVC
//
//  Created by 闫潇 on 15/1/29.
//  Copyright (c) 2015年 杨晋枝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface Map_Annotation : UIViewController<MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
