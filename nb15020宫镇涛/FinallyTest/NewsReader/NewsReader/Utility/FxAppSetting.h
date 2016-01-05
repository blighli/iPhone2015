
#import <Foundation/Foundation.h>

@interface FxAppSetting : NSObject

+ (NSString *)getValue:(NSString *)key;
+ (void)setValue:(id)value forKey:(NSString *)key;

@end
