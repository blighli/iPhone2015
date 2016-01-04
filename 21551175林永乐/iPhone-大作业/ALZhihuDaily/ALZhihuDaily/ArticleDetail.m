//
//  ArticleDetail.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/3.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ArticleDetail.h"

@implementation ArticleDetail

- (instancetype)init
{
    self = [super init];
    if (self) {
        [ArticleDetail mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID" : @"id"};
        }];
        [ArticleDetail mj_referenceReplacedKeyWhenCreatingKeyValues:YES];
        [ArticleDetail mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"recommenders" : @"Recommender"};
        }];
    }
    return self;
}

@end
