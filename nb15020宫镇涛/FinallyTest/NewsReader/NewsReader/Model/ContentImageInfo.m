

#import "ContentImageInfo.h"

@implementation ContentImageInfo

+ (instancetype)infoFromDict:(NSDictionary *)dict
{
    ContentImageInfo *info = [[ContentImageInfo alloc] init];
    
    info.ref = [dict objectForKey:@"ref"];
    info.pixel = [dict objectForKey:@"pixel"];
    info.alt = [dict objectForKey:@"alt"];
    info.src = [dict objectForKey:@"src"];
    
    return info;
}

@end
