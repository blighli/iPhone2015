//
//  MTCity.m
//  美团HD
//
//  Created by zhuzhu on 15/11/24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "MTCity.h"
#import "MJExtension.h"
#import "MTRegion.h"

@implementation MTCity
- (NSDictionary *)objectClassInArray
{
    return @{@"regions" : [MTRegion class]};
}
@end
