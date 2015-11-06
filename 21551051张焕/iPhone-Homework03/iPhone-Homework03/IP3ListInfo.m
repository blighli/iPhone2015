//
//  IP3ListInfo.m
//  iPhone-Homework03
//
//  Created by 张焕 on 11/2/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import "IP3ListInfo.h"

static NSString * const L_KEY = @"ListKey";

@implementation IP3ListInfo

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _listArray = [coder decodeObjectForKey:L_KEY];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.listArray forKey:L_KEY];
}

@end
