//
//  TWQuestions.m
//  P006SuperPuzzle-01
//
//  Created by TooWalker on 12/15/15.
//  Copyright © 2015 TooWalker. All rights reserved.
//

#import "TWQuestions.h"

@implementation TWQuestions
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.answer = dict[@"answer"];
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.options = dict[@"options"];
    }
    return self;
}
+ (instancetype)questionsWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
