//
//  ZMHAccountParam.h
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/27.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMHAccountParam : NSObject

/**
 *  AppKey
 */
@property (nonatomic, copy) NSString *client_id;
/**
 *  AppSecret
 */
@property (nonatomic, copy) NSString *client_secret;
/**
 *  请求的类型,填写authorization_code
 */
@property (nonatomic, copy) NSString *grant_type;
/**
 *  调用authorize获得的code值
 */
@property (nonatomic, copy) NSString *code;
/**
 *  回调地址
 */
@property (nonatomic, copy) NSString *redirect_uri;


@end
