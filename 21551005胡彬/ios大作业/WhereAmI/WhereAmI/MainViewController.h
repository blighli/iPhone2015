//
//  MainViewController.h
//  WhereAmI
//
//  Created by cstlab on 15/12/29.
//  Copyright © 2015年 hubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
@interface MainViewController : UIViewController<CLLocationManagerDelegate>
{
    IBOutlet UITextField *altitude;
    IBOutlet UITextField *latitude;
    IBOutlet UITextField *longitude;
    
    CLLocationManager   *locmanager;
    BOOL                wasFound;
}

- (IBAction)update;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *) oldLocation ;
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error;

@end
