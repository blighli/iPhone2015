//
//  JYAccount.h
//  顾金跃_微博
//
//  Created by 123 on 15/10/21.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYAccount : NSObject<NSCoding>
@property(nonatomic,copy)NSString *access_token;
@property(nonatomic,assign)long long expires_in;
@property(nonatomic,assign)long long remind_in;
@property(nonatomic,assign)long long uid;

//账号当时的保存时间
//@property(nonatomic,strong)NSDate *saveTime;

+(instancetype)accountWithDict:(NSDictionary *)dict;
@end
