//
//  MapViewController.h
//  AtlasMap
//
//  Created by Atlas on 15/12/26.
//  Copyright © 2015年 Atlas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController

@property (nonatomic,strong) MKMapItem *mapItem;
@property (nonatomic) MKCoordinateRegion region;

@end
