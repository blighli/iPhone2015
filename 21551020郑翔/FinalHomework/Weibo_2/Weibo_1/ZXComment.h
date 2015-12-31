//
//  ZXComment.h
//  Weibo_1
//
//  Created by zhengxiang on 15/12/21.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXComment : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *comment_date;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *weibo_id;
@property (nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)commentWithDict:(NSDictionary *)dict;

@end
