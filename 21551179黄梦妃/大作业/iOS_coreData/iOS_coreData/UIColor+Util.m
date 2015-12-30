//
//  UIColor+Util.m
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/29.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)



+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}


+ (UIColor *)colorWithHex:(int)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+(UIColor *)folderColor
{
    return [UIColor colorWithHex:0xFFEFDB];
}

+(UIColor *)folderBottomColor
{
    return [UIColor colorWithHex:0x4D4D4D];
}

+(UIColor *)themeColor
{
    
    return [UIColor colorWithHex:0xFFFAF8];
}
@end
