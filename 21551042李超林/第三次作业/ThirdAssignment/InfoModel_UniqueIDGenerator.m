//
//  InfoModel_UniqueIDGenerator.m
//  ThirdAssignment
//
//  Created by linchaolin on 29/10/2015.
//  Copyright © 2015 linchaolin. All rights reserved.
//

#import "InfoModel_UniqueIDGenerator.h"
#import "NSString_MD5.h"

@implementation InfoModel (md5)

-(NSString *) getUniqueID
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    return [currentDateStr md5HexDigest];
}

- (void)generateUniqueID {
    self.mid = [self getUniqueID];
}

@end
