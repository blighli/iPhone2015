//
//  MapViewController.h
//  MyLBS
//
//  Created by helmsmanmac on 15/9/2.
//  Copyright (c) 2015年 helmsmanmac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController

@property (nonatomic, strong) MKMapItem * mapItem;
@property (nonatomic) MKCoordinateRegion region;

@end
