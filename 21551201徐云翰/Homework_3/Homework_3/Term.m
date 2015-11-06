//
//  Term.m
//  Homework_3
//
//  Created by YunhanXu on 15/11/1.
//  Copyright © 2015年 YunhanXu. All rights reserved.
//

#import "Term.h"

@implementation Term

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(instancetype)addWithDict:(NSDictionary *)add
{
    return [[self alloc] init:add];
}

-(instancetype)init:(NSDictionary *)dict
{
    if (self=[super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(NSMutableDictionary *)getDictionary
{
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:self.inputString forKey:@"inputString"];
    return dict;
}


@end
