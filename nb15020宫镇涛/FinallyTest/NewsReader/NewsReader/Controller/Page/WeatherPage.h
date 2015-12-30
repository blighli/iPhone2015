

#import "FxBasePage.h"
#import <CoreLocation/CoreLocation.h>

@interface WeatherPage : FxBasePage <CLLocationManagerDelegate> {
    IBOutlet UILabel    *_titleLabel;
    IBOutlet UILabel    *_dayLabel;
    IBOutlet UILabel    *_temperatureLabel;
    IBOutlet UILabel    *_currentTempLabel;
    IBOutlet UILabel    *_weaterLabel;
    IBOutlet UILabel    *_windLabel;
    IBOutlet UILabel    *_humiLabel;
    IBOutlet UIImageView*_imageView;
    
    CLLocationManager   *_manager;
    NSString            *_currentCity;
}

@end
