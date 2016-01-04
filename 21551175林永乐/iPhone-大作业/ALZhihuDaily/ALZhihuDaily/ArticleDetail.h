//
//  ArticleDetail.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/3.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recommender.h"

@interface ArticleDetail : NSObject

@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *image_source;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *source_url;
@property (strong, nonatomic) NSArray *recommenders;
@property (strong, nonatomic) NSString *ga_prefix;
@property (assign, nonatomic) NSInteger type;
@property (assign, nonatomic) NSInteger ID;
@property (strong, nonatomic) NSArray *css;

@end
