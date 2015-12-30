
#import "FxPush.h"

@implementation FxPush

- (void)registerPush
{
}

- (void)unregisterPush
{
}

- (void)bindDeviceToken:(NSData *)token
{
    BASE_INFO_FUN([token description]);
}

- (void)handleNotification:(NSDictionary *)userInfo
{
}

- (void)setAlias:(NSString *)alias
{
}

- (void)unsetAlias
{
}

- (void)setTopic:(NSString *)topic
{
}

- (void)unsetTopic
{
}

@end
