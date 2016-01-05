//
//  Articles.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Article.h"
#import "TopArticle.h"

@interface Articles : NSObject

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSArray<Article *> *stories;
@property (strong, nonatomic) NSArray<TopArticle *> *top_stories;

@end
