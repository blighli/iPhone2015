
#import "FxGetAdvert.h"
#import "AdvertInfo.h"

@implementation FxGetAdvert

- (void)parseSuccess:(NSDictionary *)dict jsonString:jsonString
{
    NSDictionary *dictData = [dict objectForKey:NetData];
    AdvertInfo *advert = [AdvertInfo infoFromDict:dictData];
    
    [_delegate opSuccess:advert];
}

@end
