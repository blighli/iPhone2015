//
//  YCPermission.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/11.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCPermission.h"

@implementation YCPermission

+ (int)FOLLOW
{
    return 0x01;
}

+ (int)COMMENT
{
    return 0x02;
}

+ (int)WRITE_ARTICLES
{
    return 0x04;
}

+ (int)MODERATE_COMMENTS
{
    return 0x08;
}

+ (int)ADMINISTER
{
    return 0x80;
}

@end
