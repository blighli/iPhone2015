//
//  JYStatus.h
//  顾金跃_微博
//
//  Created by 123 on 15/10/22.
//  Copyright © 2015年 GJY. All rights reserved.
//

//微博模型
#import <Foundation/Foundation.h>

@class JYUser;
@interface JYStatus : NSObject

//微博内容
@property(nonatomic,copy)NSString *text;
//微博的创建时间
@property(nonatomic,copy)NSString *created_at;
//微博的来源
@property(nonatomic,copy)NSString *source;

//微博的ID
//@property(nonatomic,copy)NSString *idstr;
//微博的转发数
//@property(nonatomic,assign)int reposts_count;
//微博的评论数
//@property(nonatomic,assign)int comments_count;
//微博的表态数(赞)
//@property(nonatomic,assign)int attitudes_count;

//微博的作者
@property(nonatomic,strong)JYUser *user;

//微博的单张配图
@property(nonatomic,copy)NSString *thumbnail_pic;
//多张图片
@property(nonatomic,strong)NSArray *pic_urls;


//被转发的微博
//@property(nonatomic,strong)JYStatus *retweeted_status;


+(instancetype)statusWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
