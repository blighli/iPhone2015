#import "NSString+fk.h"

@implementation NSString (fk)

+ (BOOL) isPureInt: (NSString*) str
{
	NSScanner* scan = [NSScanner scannerWithString:str]; 
    int val; 
    return [scan scanInt:&val] && [scan isAtEnd];
}

@end