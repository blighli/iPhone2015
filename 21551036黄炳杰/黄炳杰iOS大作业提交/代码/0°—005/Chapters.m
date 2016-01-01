//
//  Chapters.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import "Chapters.h"

@implementation Chapters

@synthesize chapters = _chapters;

-(id)init{
    if ((self = [super init])) {
        self.chapters = [[[NSMutableArray alloc]init]autorelease];
    }
    return self;
}
-(void)dealloc{
    [super dealloc];
}


@end
