//
//  Chapter.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import "Chapter.h"

@implementation Chapter

@synthesize name = _name;
@synthesize number = _number;
@synthesize unlocked = _unlocked;

-(id)initWithName:(NSString *)name number:(int)number unlocked:(BOOL)unlocked{
    if ((self = [super init])) {
        self.name = name;
        self.number = number;
        self.unlocked = unlocked;
    }
    return self;
}

-(void)dealloc{
    [super dealloc];
}




@end
