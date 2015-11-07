//
//  Util.m
//  Calendar
//
//  Created by 毛毛 on 15/10/26.
//  Copyright © 2015年 毛毛. All rights reserved.
//

#import "Util.h"

@implementation Utils

+(NSString *)addSpace:(NSInteger)n string:(NSString *)str len:(NSInteger)len {
    long left=(n-len)/2;
    int i;
    NSMutableString *str1=[NSMutableString string];
    for (i=1; i<=left; i++) {
        [str1 appendString:@" "];
    }
    [str1 appendString:str];
    i+=len;
    for (; i<=n; i++) {
        [str1 appendString:@" "];
    }
    return str1;
}

@end
