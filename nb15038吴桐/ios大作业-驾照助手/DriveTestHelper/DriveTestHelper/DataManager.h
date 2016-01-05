//
//  DataManager.h
//  DriveTestHelper
//
//  Created by wp on 15/12/16.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    chapter,//章节
    answer,//题目
    speciality//专项
}DataType;

@interface DataManager : NSObject
+(NSArray *)getData:(DataType)type;
@end
