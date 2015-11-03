//
//  Bills.h
//  homework3
//
//  Created by 敏少eclipse on 15/11/1.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bills : NSObject
@property (nonatomic,copy) NSString * title;
+(instancetype)billWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
-(NSDictionary *)getDictionary;
@end
