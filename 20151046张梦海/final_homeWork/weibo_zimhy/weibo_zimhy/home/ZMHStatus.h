//
//  ZMHStatus.h
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//



#import <Foundation/Foundation.h>

#import "MJExtension.h"
#import "ZMHUser.h"

@interface ZMHStatus : NSObject<MJKeyValue>


/**
 *  转发微博
 */
@property (nonatomic, strong) ZMHStatus *retweeted_status;

/**
 *  转发微博昵称
 */
@property (nonatomic, copy) NSString *retweetName;

/**
 *  用户
 */
@property (nonatomic, strong) ZMHUser *user;

/**
 *  微博创建时间
 */
@property (nonatomic, copy) NSString *created_at;

/**
 *  字符串型的微博ID
 */
@property (nonatomic, copy) NSString *idstr;

/**
 *  微博信息内容
 */
@property (nonatomic, copy) NSString *text;

/**
 *  微博来源
 */
@property (nonatomic, copy) NSString *source;

/**
 *  转发数
 */
@property (nonatomic, assign) int reposts_count;

/**
 *  评论数
 */
@property (nonatomic, assign) int comments_count;

/**
 *  表态数(赞)
 */
@property (nonatomic, assign) int attitudes_count;

/**
 *  配图数组(ZMHPhoto)
 */
@property (nonatomic, strong) NSArray *pic_urls;

@end
