//
//  Cities.h
//  美团
//
//  Created by 陈受恩 on 15/12/13.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cities : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *pinYin;
@property (nonatomic,copy)NSString *pinYinHead;
@property (nonatomic,copy)NSArray *regions;
+(NSArray *)getCities;
/**
 *  返回城市
 */
+ (NSArray *)cities;

/**
 *  返回所有的排序数据
 */
+ (NSArray *)sorts;

@end
