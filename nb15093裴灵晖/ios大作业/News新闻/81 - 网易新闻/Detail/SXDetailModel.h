//
//  SXDetailModel.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface SXDetailModel : NSObject

/** 新闻标题 */
@property (nonatomic, copy) NSString *title;
/** 新闻发布时间 */
@property (nonatomic, copy) NSString *ptime;
/** 新闻内容 */
@property (nonatomic, copy) NSString *body;
/** 新闻配图(希望这个数组中以后放NewsDetailImg模型) */
@property (nonatomic, strong) NSArray *img;

+ (instancetype)detailWithDict:(NSDictionary *)dict;

@end
