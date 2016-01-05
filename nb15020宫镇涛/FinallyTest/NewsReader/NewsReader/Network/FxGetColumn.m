

#import "FxGetColumn.h"
#import "ColumnInfo.h"
#import "FxDBManager.h"

@implementation FxGetColumn

- (void)parseSuccess:(NSDictionary *)dict jsonString:jsonString
{
    NSArray *infos = [ColumnInfo arrayFromDict:dict];
    [_delegate opSuccess:infos];
    
    NSString *pageId = [_opInfo objectForKey:@"body"];
    [FxDBManager saveColumns:@{@"pageid":pageId, @"json":jsonString}];
}

@end
