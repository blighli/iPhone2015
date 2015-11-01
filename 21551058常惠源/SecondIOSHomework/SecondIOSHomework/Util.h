//
//  Util.h
//  SecondIOSHomework
//
//  Created by 常惠源 on 15/10/20.
//  Copyright © 2015年 常惠源. All rights reserved.
//

#ifndef Util_h
#define Util_h


#endif /* Util_h */
#import <Foundation/Foundation.h>
@interface Util : NSObject

+ (BOOL)isLegalYeah: (int)year;
+ (BOOL)isLegalYear: (int)year
        andMonth: (int)month;
+ (void)showParamErrorTip;
+(int)howManyDaysInThisMonth:(int)year month: (int)imonth;
@end