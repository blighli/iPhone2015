//
//  DB.h
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DB : NSObject

+ (sqlite3 *)shareDataBase;

@end
