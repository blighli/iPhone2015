//
//  QuestionInfo.m
//  MyCrazyGuessImage
//
//  Created by zhuzhu on 15/11/25.
//  Copyright © 2015年 wequeen. All rights reserved.
//

#import "QuestionInfo.h"

@implementation QuestionInfo
{
    UIImage *_image;
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)questionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(UIImage *)image
{
    if (!_image) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}
+(NSArray *)questions
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"questions" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self questionWithDict:dict]];
    }
    return [arrayM copy];
}
@end
