//
//  Model.m
//  mdb_003
//
//  Created by wanghaobo on 15/10/29.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)init {
    self = [super init];
    if (self) {
        self.list = [NSMutableArray arrayWithCapacity:50];
        for (int i=0; i < 50; i++) {
            NSString *str = [NSString stringWithFormat:@"备忘-%d",i];
            [self.list addObject:str];
        }
    }
    return self;
}
@end
