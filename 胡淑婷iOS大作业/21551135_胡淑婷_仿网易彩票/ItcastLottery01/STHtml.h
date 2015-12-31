//
//  STHtml.h
//  ItcastLottery01
//
//  Created by 123 on 15/11/29.
//  Copyright © 2015年 HST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STHtml : NSObject
/**
 网页标题
 */
@property(nonatomic,copy)NSString *title;
/**
 网页文件名
 */
@property(nonatomic,copy)NSString *html;

@property(nonatomic,copy)NSString *ID;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)htmlWithDict:(NSDictionary *)dict;
@end
