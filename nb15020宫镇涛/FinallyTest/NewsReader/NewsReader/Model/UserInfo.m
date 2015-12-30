

#import "UserInfo.h"

@implementation UserInfo

+ (UserInfo *)infoFromDict:(NSDictionary *)dict
{
    UserInfo *info = [[UserInfo alloc] init];
    
    info.ID = [dict objectForKey:@"id"];
    info.name = [dict objectForKey:@"name"];
    info.token = [dict objectForKey:@"token"];
    
    return info;
}

@end
