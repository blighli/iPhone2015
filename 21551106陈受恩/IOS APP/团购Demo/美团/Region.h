//
//  Region.h
//  美团
//
//  Created by 陈受恩 on 15/12/22.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Region : NSObject
/** 区域名字 */
@property (nonatomic, copy) NSString *name;
/** 子区域 (字符串) */
@property (nonatomic, strong) NSArray *subregions;

@end
