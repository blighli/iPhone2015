#import "NSString+LM.h"

@implementation NSString (LM)

+(NSString *)getMinuteSecondWithSecond:(NSTimeInterval)time{
    
    int minute = (int)time / 60;
    int second = (int)time % 60;
    
    if (second > 9) {
        return [NSString stringWithFormat:@"%d:%d",minute,second];
    }
    return [NSString stringWithFormat:@"%d:0%d",minute,second];
}

@end
