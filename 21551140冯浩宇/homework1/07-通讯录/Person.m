//
//  Person.m
//  07-通讯录
//
//  Created by 冯浩宇 on 15/10/10.
//  Copyright © 2015年 ZJU. All rights reserved.
//

#import "Person.h"

@implementation Person
-(instancetype) initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.name = dict[@"name"];
        self.telephone = dict[@"telephone"];
    }
    return self;
}
@end
