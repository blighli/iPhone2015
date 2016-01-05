

#import "MiPush.h"

@implementation MiPush

- (void)registerPush
{
    [MiPushSDK registerMiPush:self];
}

- (void)unregisterPush
{
    [MiPushSDK unregisterMiPush];
}

- (void)bindDeviceToken:(NSData *)token
{
    [super bindDeviceToken:token];
    [MiPushSDK bindDeviceToken:token];
}

- (void)handleNotification:(NSDictionary *)userInfo
{
    NSString *messageId = [userInfo objectForKey:@"_id_"];
    [MiPushSDK openAppNotify:messageId];
}

- (void)setAlias:(NSString *)alias
{
    [MiPushSDK setAlias:alias];
}

- (void)unsetAlias
{
    [MiPushSDK unsetAlias:self.aliasName];
}

- (void)setTopic:(NSString *)topic
{
    [MiPushSDK subscribe:topic];
}

- (void)unsetTopic
{
    [MiPushSDK unsetAlias:self.topicName];
}


#pragma mark - MiPushSDKDelegate

- (void)miPushRequestSuccWithSelector:(NSString *)selector data:(NSDictionary *)data
{
    BASE_INFO_FUN(([NSString stringWithFormat:@"(%@:%@)", selector,data]));
    
    // 注册
    if ([selector isEqualToString:MiPushRegister]) {
        self.userId = [data objectForKey:@"userId"];
    }
    //设置别名
    else if ([selector isEqualToString:MiPushSetAlias]) {
        self.aliasName = [data objectForKey:@"alias"];
    }
    //设置主题
    else if ([selector isEqualToString:MiPushSetTopic]) {
        self.topicName = [data objectForKey:@"topic"];
    }
    
    //都设置成功后调用服务器接口
    if (self.userId != nil && self.aliasName != nil && self.topicName != nil) {
        
    }
}

- (void)miPushRequestErrWithSelector:(NSString *)selector error:(int)error data:(NSDictionary *)data
{
    BASE_ERROR_FUN(([NSString stringWithFormat:@"(%d|%@:%@)", error,selector,data]));
}

@end
