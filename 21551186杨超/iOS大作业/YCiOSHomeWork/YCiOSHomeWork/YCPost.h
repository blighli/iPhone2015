//
//  YCPost.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/10.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCPost : NSObject
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *author_name;
@property (nonatomic,copy) NSString *author_avatar_hash;
@property (nonatomic,copy) NSString *author_image_url;
@property (nonatomic,copy) NSString *body;
@property (nonatomic,copy) NSString *body_html;
@property (nonatomic,copy) NSString *timestamp;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *comments;
@property (nonatomic,assign) int id;
@property (nonatomic,assign) int comment_count;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)PostWithDict:(NSDictionary *)dict;
@end
