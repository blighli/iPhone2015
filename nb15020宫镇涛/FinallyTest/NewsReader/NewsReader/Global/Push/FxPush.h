

#import <Foundation/Foundation.h>

@interface FxPush : NSObject 

@property(nonatomic, strong) NSString   *userId;
@property(nonatomic, strong) NSString   *aliasName;
@property(nonatomic, strong) NSString   *topicName;

- (void)registerPush;
- (void)unregisterPush;
- (void)bindDeviceToken:(NSData *)token;
- (void)handleNotification:(NSDictionary *)userInfo;

- (void)setAlias:(NSString *)alias;
- (void)unsetAlias;
- (void)setTopic:(NSString *)topic;
- (void)unsetTopic;

@end
