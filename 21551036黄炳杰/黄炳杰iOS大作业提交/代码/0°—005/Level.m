//
//  Level.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Level.h"


@implementation Level

@synthesize name = _name;
@synthesize number = _number;
@synthesize unlocked = _unlocked;
@synthesize stars = _stars;
@synthesize levelClear = _levelClear;


-(id)initWithName:(NSString *)name number:(int)number unlocked:(BOOL)unlocked stars:(int)stars data:(NSString *)data levelClear:(BOOL)levelClear{
    if ((self = [super init])) {
        self.name = name;
        self.number = number;
        self.unlocked = unlocked;
        self.stars = stars;
        self.data = data;
        self.levelClear = levelClear;
    }
    return self;
}

-(void)dealloc{
    [super dealloc];
}

@end
