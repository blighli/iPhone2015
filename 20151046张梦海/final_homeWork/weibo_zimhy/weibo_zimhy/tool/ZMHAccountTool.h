//
//  ZMHAccountTool.h
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/27.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZMHAccount;

@interface ZMHAccountTool : NSObject



+ (void)saveAccount:(ZMHAccount *)account;

+ (ZMHAccount *)account;

+ (void)accountWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure;


@end
