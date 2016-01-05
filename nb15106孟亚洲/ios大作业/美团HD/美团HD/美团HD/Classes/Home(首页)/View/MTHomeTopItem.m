//
//  MTHomeItem.m
//  美团HD
//
//  Created by cstlab on 15/11/18.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "MTHomeTopItem.h"

@implementation MTHomeTopItem

+ (instancetype)item
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MTHomeTopItem" owner:nil options:nil] firstObject];
}

@end
