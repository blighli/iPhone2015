//
//  YTSettingGroup.h
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import <Foundation/Foundation.h>

@interface YTSettingGroup : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;

@property (nonatomic, strong) NSArray *items;
@end
