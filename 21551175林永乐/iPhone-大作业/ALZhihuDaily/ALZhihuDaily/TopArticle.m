//
//  TopArticle.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/2.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "TopArticle.h"

@implementation TopArticle

- (instancetype)init
{
    self = [super init];
    if (self) {
        [TopArticle mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID" : @"id"};
        }];
        [TopArticle mj_referenceReplacedKeyWhenCreatingKeyValues:YES];
    }
    return self;
}

@end
