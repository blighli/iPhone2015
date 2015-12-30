

#import <Foundation/Foundation.h>

@interface FxStatis : NSObject

+ (void)setup;

+ (void)intoPage:(NSString *)pageName;
+ (void)outPage:(NSString *)pageName;

+ (void)event:(NSString *)event
        value:(NSString *)value;

@end

