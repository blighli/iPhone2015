//
//  Article.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *ga_prefix;
@property (strong, nonatomic) NSArray<NSString *> *images;
@property (assign, nonatomic) NSInteger type;
@property (assign, nonatomic) NSInteger ID;

@end
