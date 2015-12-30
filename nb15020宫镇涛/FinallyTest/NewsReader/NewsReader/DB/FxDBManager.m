

#import "FxDBManager.h"
#import "FxDBManager+Private.h"

@implementation FxDBManager

#define TableColumns    @"FxColumns"
#define TableNews       @"FxNews"


+ (void)saveColumns:(NSDictionary *)dictInfo
{
    NSString *dbFile = [FxGlobal getUserDBFile];
    
    //存储
    [FxDBManager save:dictInfo
           primaryKey:@"pageid"
              inTable:TableColumns
             inDBFile:dbFile];
}

+ (NSArray *)fetchColumns:(NSString *)pageID
{
    NSString *dbFile = [FxGlobal getUserDBFile];
    NSDictionary *dict = @{@"pageid":pageID};
    NSArray *fields = @[@"pageid",@"json"];
    NSArray *contents = [FxDBManager fetchWithCondition:dict
                                              forFields:fields
                                                inTable:TableColumns
                                               inDBFile:dbFile];
    
    if (contents.count > 0) {
        dict = [contents objectAtIndex:0];
        dict = [FxJsonUtility jsonValueFromString:[dict objectForKey:@"json"]];
        return [ColumnInfo arrayFromArray:[dict objectForKey:NetData]];
    }
    
    return nil;
}

+ (void)saveNews:(NSDictionary *)dictInfo
{
    NSString *dbFile = [FxGlobal getUserDBFile];
    
    //存储
    [FxDBManager save:dictInfo
           primaryKey:@"columnid"
              inTable:TableNews
             inDBFile:dbFile];
}

+ (NSArray *)fetchNews:(NSString *)columnID
{
    NSString *dbFile = [FxGlobal getUserDBFile];
    NSDictionary *dict = @{@"columnid":columnID};
    NSArray *fields = @[@"columnid",@"json"];
    NSArray *contents = [FxDBManager fetchWithCondition:dict
                         forFields:fields
                         inTable:TableNews
                         inDBFile:dbFile];
    
    if (contents.count > 0) {
        dict = [contents objectAtIndex:0];
        dict = [FxJsonUtility jsonValueFromString:[dict objectForKey:@"json"]];
        return [NewsInfo arrayFromArray:[dict objectForKey:NetData]];
    }
    
    return nil;
}

@end
