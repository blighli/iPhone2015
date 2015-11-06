//
//  IP3ListInfo.m
//  iPhone-Homework03
//
//  Created by alezai on 15/10/30.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import "IP3ListInfo.h"

static NSString * const kListKey = @"kListKey";

@implementation IP3ListInfo

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _listArray = [coder decodeObjectForKey:kListKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.listArray forKey:kListKey];
}

@end
