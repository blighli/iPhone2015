//
//  ZMHAccount.h
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/27.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMHAccount : NSObject<NSCoding>



/**
 *  获取数据的访问命令牌
 */
@property (nonatomic, copy) NSString *access_token;
/**
 *  账号的有效期
 */
@property (nonatomic, copy) NSString *expires_in;
/**
 *  用户唯一标识符
 */
@property (nonatomic, copy) NSString *uid;

/**
 *   过期时间 = 当前保存时间+有效期
 */
@property (nonatomic, strong) NSDate *expires_date;

/**
 *  账号的有效期
 */
@property (nonatomic, copy) NSString *remind_in;

/**
 *  用户的昵称
 */
@property (nonatomic, copy) NSString *name;


+ (instancetype)accountWithDict:(NSDictionary *)dict;



@end
