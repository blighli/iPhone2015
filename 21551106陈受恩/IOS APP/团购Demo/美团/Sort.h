//
//  Sort.h
//  美团
//
//  Created by 陈受恩 on 15/12/17.
//  Copyright © 2015年 chenshouen. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Sort : NSObject
/** 排序名称 */
@property (nonatomic, copy) NSString *label;
/** 排序的值(将来发给服务器) */
@property (nonatomic, assign) int value;
@end
