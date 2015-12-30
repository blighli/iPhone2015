

#import "WeatherPage.h"
#import "FxWeather.h"
#import "WeatherInfo.h"
#import "FxString.h"
#import <CoreLocation/CoreLocation.h>

@implementation WeatherPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startLocation];
    
    StatisEvent(@"WeatherID", GetPageName());
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark - Location methods

- (void)startLocation
{
    if ([CLLocationManager locationServicesEnabled]) {
        _manager = [[CLLocationManager alloc] init];
        
        _manager.delegate = self;
        //控制定位精度,越高耗电量越大
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        //控制定位服务更新频率。单位是“米”
        _manager.distanceFilter = LocationDistance;
        
        [_manager startUpdatingLocation];
        
        if (![FxGlobal isSystemLowIOS8]) {
            [_manager requestAlwaysAuthorization];
        }
    }
}

- (void)searchCityName:(CLLocation *)location
{
    CLGeocoder *coder = [[CLGeocoder alloc] init];
 
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *mark in placemarks) {
            BASE_INFO_FUN(mark.name);
            BASE_INFO_FUN(mark.locality);
            _currentCity = [mark.locality stringByReplacingOccurrencesOfString:WeatherSuffix withString:@""];
            
            [self executeRealOp];
        }
     }];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    BASE_ERROR_FUN(([NSString stringWithFormat:@"status:%@",@(status)]));
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    [self searchCityName:newLocation];
}

-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations firstObject];
    
    [self searchCityName:newLocation];
    
    //停止更新位置（如果定位服务不需要实时更新的话，那么应该停止位置的更新）
    [_manager stopUpdatingLocation];
}


#pragma mark - Real Weather

- (void)executeRealOp
{
    [self showIndicator:LoadingTip autoHide:NO afterDelay:NO];
    
    NSString *url = [NSString stringWithFormat:WeatherRealFmt, [FxString urlEncodeCovertString:_currentCity]];
    NSDictionary *dictInfo = @{@"url":url};
    
    _operation = [[FxWeather alloc] initWithDelegate:self opInfo:dictInfo];
    [_operation executeOp];
}

- (void)opSuccess:(WeatherInfo *)data
{
    [super opSuccess:data];
    [self updateUI:data];
}

- (void)updateUI:(WeatherInfo *)info
{
    _titleLabel.text = info.cityName;
    _dayLabel.text = [NSString stringWithFormat:@"%@ %@", info.day, info.week];
    _temperatureLabel.text = info.temperature;
    _currentTempLabel.text = info.currentTemp;
    _weaterLabel.text = info.name;
    _windLabel.text = [NSString stringWithFormat:@"%@ %@", info.wind, info.windGrad];
    _humiLabel.text = info.humidity;

    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:info.iconUrl]];
    _imageView.image = [UIImage imageWithData:imageData];
}

@end
