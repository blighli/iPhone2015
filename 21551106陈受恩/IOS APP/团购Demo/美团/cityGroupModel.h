//
//  cityGroupModel.h
//  美团
//
//  Created by 陈受恩 on 15/12/10.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cityGroupModel : NSObject
//属性声明 字符串＋城市数组
@property (nonatomic,strong)NSArray* cities;
@property (nonatomic,copy)NSString *title;

-(NSArray*)getModelArray;

@end
