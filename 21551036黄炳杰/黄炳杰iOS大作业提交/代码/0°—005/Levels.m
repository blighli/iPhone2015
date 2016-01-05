//
//  Levels.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import "Levels.h"

@implementation Levels

@synthesize levels = _levels;

-(id)init{
    if ((self = [super init])) {
        self.levels = [[[NSMutableArray alloc]init]autorelease];
    }
    return self;
}

-(void)dealloc{
    [super dealloc];
}

@end
