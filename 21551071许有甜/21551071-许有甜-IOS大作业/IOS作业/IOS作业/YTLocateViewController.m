//
//  YTLocateViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/31.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTLocateViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface YTLocateViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>
@property (nonatomic, strong)CLLocationManager *locMgr;
@property (nonatomic, strong) CLGeocoder *geocoder;
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) CLPlacemark *pm;

@end

@implementation YTLocateViewController


- (MKMapView *)mapView
{
    if (!_mapView) {
        _mapView = [[MKMapView alloc]init];
        _mapView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    return _mapView;
}
- (CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}


-(CLLocationManager *)locMgr
{
    // 定位服务不可用
    if (![CLLocationManager locationServicesEnabled]) {
        return nil;
    }
    if (!_locMgr) {
        // 创建定位管理者
        _locMgr = [[CLLocationManager alloc] init];
        // 设置代理
        _locMgr.delegate = self;
        
        _locMgr.desiredAccuracy=kCLLocationAccuracyBest;
    }
    return _locMgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.locMgr.distanceFilter=10;
    
    [self.locMgr requestWhenInUseAuthorization];//使用程序其间允许访问位置数据（iOS8定位需要）
    [self.locMgr startUpdatingLocation];//开启定位
    // 开始定位
    [self.locMgr startUpdatingLocation];
    
    [self.view addSubview:self.mapView];
    
    //  设置用户的跟踪模式(显示用户的具体位置)
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    // 设置地图类型
    self.mapView.mapType = MKMapTypeStandard;
    
    // 设置代理
    self.mapView.delegate = self;
    
}
/**
 *  只要定位到用户的位置，就会调用（调用频率高）
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
    NSLog(@"didUpdateLocations ---%@",locations);
    
    // 取出位置对象
    CLLocation *loc = [locations firstObject];
    
    // 打印经纬度
    NSLog(@"%f-----%f", loc.coordinate.latitude,loc.coordinate.longitude);
    [self reverseGeocode:loc];
    // 停止定位
    [manager stopUpdatingLocation];
}

/**
 *  当用的位置更新
 */
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%f*****%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    userLocation.title = [NSString stringWithFormat:@"%@ %@ %@", self.pm.country, self.pm.administrativeArea, self.pm.locality];
    userLocation.subtitle = [NSString stringWithFormat:@"%@ %@ %@", self.pm.subLocality, self.pm.thoroughfare, self.pm.subThoroughfare];
    //userLocation.subtitle = self.pm.
    NSLog(@"%@",self.pm.name);
}

/**
 *  反地理编码
 */
- (void)reverseGeocode :(CLLocation *)loc
{
    
    // 反地理编码
    [self.geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) { // 有错误（地址乱输入）
            NSLog(@"你找的地址可能只在火星有！！！");
        } else { // 编码成功
            // 取出最前面的地址
            self.pm = [placemarks firstObject];
            
            // 设置具体地址
            NSLog(@"=====%@",self.pm.name);
        }
    }];
}

@end
