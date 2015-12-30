

#import <Foundation/Foundation.h>
#import "NewsInfo.h"
#import "ColumnInfo.h"

@interface FxDBManager : NSObject

+ (void)saveColumns:(NSDictionary *)dictInfo;
+ (NSArray *)fetchColumns:(NSString *)pageID;

+ (void)saveNews:(NSDictionary *)dictInfo;
+ (NSArray *)fetchNews:(NSString *)columnID;

@end
