//
//  Person.h
//  07-通讯录
//
//  Created by 冯浩宇 on 15/10/10.
//  Copyright © 2015年 ZJU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *telephone;
-(instancetype) initWithDict:(NSDictionary *)dict;
@end
