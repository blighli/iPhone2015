

#import "FxGetChart.h"

@implementation FxGetChart

- (void)parseSuccess:(NSDictionary *)dict jsonString:jsonString
{
    [_delegate opSuccess:jsonString];
}

@end
