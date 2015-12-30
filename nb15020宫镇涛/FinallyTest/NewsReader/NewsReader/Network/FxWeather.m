
#import "FxWeather.h"
#import "WeatherInfo.h"

@implementation FxWeather

- (void)parseData:(NSData *)data
{
    if (data.length <= 0) { //返回的长度为0，认为成功
        [self parseSuccess:nil jsonString:nil];
        return;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSMutableDictionary *dict = [FxJsonUtility jsonValueFromString:jsonString];
    BOOL success = [[dict objectForKey:@"success"] boolValue];
    NSDictionary *dictResult = [dict objectForKey:@"result"];
    
    if (success) {
        [self parseSuccess:dictResult jsonString:jsonString ];
    }
    else {
        [self parseFail:jsonString];
    }
    
    _receiveData = nil;
}

- (void)parseSuccess:(NSDictionary *)dict jsonString:jsonString
{
    WeatherInfo *info = [WeatherInfo infoFromDict:dict];
    
    [_delegate opSuccess:info];
}

@end
