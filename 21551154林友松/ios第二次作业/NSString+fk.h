#import <Foundation/Foundation.h>
/*
	扩展NSString类
	1.增加判断字符串是否为整数
*/

@interface NSString (fk)
+ (BOOL) isPureInt: (NSString*) str;
@end