//
//  DataBaseMananger.h
//  WordNote
//
//  Created by 常惠源 on 12/29/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataBaseMananger : NSObject

// 单例声明
+(instancetype )shareManeger;

// 数据存储
-(void)saveDataWithKey:(NSString *)key params:(NSDictionary *)params;

// 数据读取 读取所有数据
-(NSArray *)getDataFromDB;

// 根据ID读取数据
-(YTKKeyValueItem *)getItemsByID:(NSString *)objectID;

// 删除数据
-(void)deleteDataWithID:(NSString *)Id;

// 字典转化成JSON
- (NSString*)dictionaryToJson:(NSDictionary *)dic;




@end
