//
//  YCComment.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/15.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCComment : NSObject
@property (nonatomic,copy) NSString *body;
@property (nonatomic,copy) NSString *body_html;
@property (nonatomic,copy) NSString *timestamp;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *author_username;
@property (nonatomic,assign) int post_id;
@property (nonatomic,assign) BOOL disabled;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)commentWithDict:(NSDictionary *)dict;
@end
