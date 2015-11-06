//
//  InfoModel.m
//  ThirdAssignment
//
//  Created by Xin on 28/10/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

#import "InfoModel.h"

@implementation InfoModel

+ (instancetype)modelWithInfo:(NSString *)info {
    return [[self alloc]initWithInfo:info];
}

- (instancetype)initWithInfo:(NSString *)info {
    self = [super init];
    if (self) {
        self.info = info;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.info forKey:@"info"];
    [aCoder encodeObject:self.mid forKey:@"mid"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.info = [aDecoder decodeObjectForKey:@"info"];
        self.mid = [aDecoder decodeObjectForKey:@"mid"];
    }
    return self;
}

@end
