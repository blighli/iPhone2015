
#import "FxDBManager.h"

@interface FxDBManager (Private)


+ (void)save:(NSDictionary *)dictContent
  primaryKey:(NSString *)primaryKey
     inTable:(NSString *)tableName
    inDBFile:(NSString *)dbFile;

+ (NSMutableArray *)fetchWithCondition:(NSDictionary *)dictCondition
                           forFields:(NSArray *)fields
                             inTable:(NSString *)tableName
                            inDBFile:(NSString *)dbFile;

+ (void)deleteWithCondition:(NSDictionary *)dictCondition
                    inTable:(NSString *)tableName
                   inDBFile:(NSString *)dbFile;

@end
