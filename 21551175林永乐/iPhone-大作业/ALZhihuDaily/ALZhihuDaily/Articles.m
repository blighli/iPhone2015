//
//  Articles.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "Articles.h"

@implementation Articles

- (instancetype)init
{
    self = [super init];
    if (self) {
        [Articles mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"stories" : @"Article",
                     @"top_stories" : @"TopArticle"};
        }];
    }
    return self;
}

@end
