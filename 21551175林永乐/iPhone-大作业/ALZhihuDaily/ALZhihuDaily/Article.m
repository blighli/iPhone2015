//
//  Article.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "Article.h"

@implementation Article

- (instancetype)init
{
    self = [super init];
    if (self) {
        [Article mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID" : @"id"};
        }];
        [Article mj_referenceReplacedKeyWhenCreatingKeyValues:YES];
    }
    return self;
}

@end
