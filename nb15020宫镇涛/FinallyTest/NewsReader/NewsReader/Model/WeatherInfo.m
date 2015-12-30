

#import "WeatherInfo.h"

@implementation WeatherInfo

+ (instancetype)infoFromDict:(NSDictionary *)dict
{
    WeatherInfo *info = [[WeatherInfo alloc] init];
    
    info.name = [dict objectForKey:@"weather"];
    info.cityName = [dict objectForKey:@"citynm"];
    info.day = [dict objectForKey:@"days"];
    info.week = [dict objectForKey:@"week"];
    info.temperature = [dict objectForKey:@"temperature"];
    info.currentTemp = [dict objectForKey:@"temperature_curr"];
    info.humidity = [dict objectForKey:@"humidity"];
    info.iconUrl = [dict objectForKey:@"weather_icon"];
    info.wind = [dict objectForKey:@"wind"];
    info.windGrad = [dict objectForKey:@"winp"];
    
    return info;
}

@end
