//
//  YCPermission.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/11.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCPermission : NSObject
+ (int)FOLLOW;
+ (int)COMMENT;
+ (int)WRITE_ARTICLES;
+ (int)MODERATE_COMMENTS;
+ (int)ADMINISTER;
@end
