//
//  STProduct.h
//  ItcastLottery01
//
//  Created by 123 on 15/11/28.
//  Copyright © 2015年 HST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STProduct : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *scheme;//打开应用所用的URL
@property(nonatomic,copy)NSString *url;//下载应用的url
@property(nonatomic,copy)NSString *identifier;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)productWithDict:(NSDictionary *)dict;
@end
