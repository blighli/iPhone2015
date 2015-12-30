//
//  MainViewController.m
//  WhereAmI
//
//  Created by cstlab on 15/12/29.
//  Copyright © 2015年 hubin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self update];
    // Do any additional setup after loading the view.
}
//更新按钮的方法
- (IBAction)update {
    
    locmanager = [[CLLocationManager alloc] init];
    [locmanager requestWhenInUseAuthorization];
    [locmanager setDelegate:self];
    [locmanager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [locmanager startUpdatingLocation];
}
//定位成功调用的方法
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (wasFound) return;
    wasFound = YES;
    
    CLLocationCoordinate2D loc = [newLocation coordinate];
    
    latitude.text = [NSString stringWithFormat: @"%f", loc.latitude];
    longitude.text	= [NSString stringWithFormat: @"%f", loc.longitude];
    altitude.text = [NSString stringWithFormat: @"%f", newLocation.altitude];
    
//定位失败调用的方法
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{ 
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"错误通知" message:[error description] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
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
