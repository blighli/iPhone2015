
#import "BaseInfo.h"

@interface WeatherInfo : BaseInfo

@property(nonatomic, strong) NSString *day;
@property(nonatomic, strong) NSString *week;
@property(nonatomic, strong) NSString *cityName;
@property(nonatomic, strong) NSString *temperature;
@property(nonatomic, strong) NSString *currentTemp;
@property(nonatomic, strong) NSString *humidity;
@property(nonatomic, strong) NSString *wind;
@property(nonatomic, strong) NSString *windGrad;
@property(nonatomic, strong) NSString *iconUrl;

@end
