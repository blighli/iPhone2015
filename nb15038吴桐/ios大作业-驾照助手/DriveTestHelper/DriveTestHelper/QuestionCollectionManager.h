//
//  QuestionCollectionManager.h
//  DriveTestHelper
//
//  Created by wp on 15/12/26.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionCollectionManager : NSObject
+(NSArray *)getWrongQuestionId;
+(void)addWrongQuestionId:(NSString *)mid;
+(void)removeWrongQuestionId:(NSString *)mid;

+(NSArray *)getCollectionQuestionId;
+(void)addCollectionQuestionId:(NSString *)mid;
+(void)removeCollectionQuestionId:(NSString *)mid;

+(int)getMyScore;
+(void)setMyScore:(int)score;

+(void)clear;

@end
