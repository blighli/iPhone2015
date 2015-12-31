

#import "AppDelegate.h"

// 应用程序托管
#define AppDelegateInstance	                        ((AppDelegate*)([UIApplication sharedApplication].delegate))

// 其它的宏定义
#ifdef DEBUG
	#define                                         LOG(...) NSLog(__VA_ARGS__)
	#define                                         LOG_METHOD NSLog(@"%s", __func__)
    #define                                         LOGERROR(...) NSLog(@"%@传入数据有误",__VA_ARGS__)
#else
	#define                                         LOG(...)
	#define                                         LOG_METHOD
    #define                                         LOGERROR(...) NSLog(@"%@传入数据有误",__VA_ARGS__)
#endif

//判断系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
//判断是否大于 IOS7
#define IS_IOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")

//判断是否是iphone5
#define IS_WIDESCREEN                              ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - (double)568 ) < __DBL_EPSILON__ )
#define IS_IPHONE                                  ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ] || [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone Simulator" ])
#define IS_IPOD                                    ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch" ] )
#define IS_IPHONE_5                                ( IS_IPHONE && IS_WIDESCREEN )

//判断字符串是否为空
#define IFISNIL(v)                                 (v = (v != nil) ? v : @"")
//判断NSNumber是否为空
#define IFISNILFORNUMBER(v)                        (v = (v != nil) ? v : [NSNumber numberWithInt:0])
//判断是否是字符串
#define IFISSTR(v)                                 (v = ([v isKindOfClass:[NSString class]]) ? v : [NSString stringWithFormat:@"%@",v])
