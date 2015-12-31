//
//  JYUser.h
//  顾金跃_微博
//
//  Created by 123 on 15/10/22.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYUser : NSObject

//用户的id
//@property(nonatomic,copy)NSString *idstr;
//用户的昵称
@property(nonatomic,copy)NSString *name;
//用户的头像
@property(nonatomic,copy)NSString *profile_image_url;

/*
会员等级
 */
@property(nonatomic,assign) int mbrank;

/*
 会员类型
 */
@property(nonatomic,assign) int mbtype;

+(instancetype)userWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
