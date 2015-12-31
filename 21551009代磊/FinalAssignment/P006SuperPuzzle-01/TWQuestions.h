//
//  TWQuestions.h
//  P006SuperPuzzle-01
//
//  Created by TooWalker on 12/15/15.
//  Copyright © 2015 TooWalker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWQuestions : NSObject
@property (copy, nonatomic) NSString *answer;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *options;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)questionsWithDict:(NSDictionary *)dict;
@end
