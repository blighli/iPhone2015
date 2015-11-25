//
//  NSString_MD5.m
//  ThirdAssignment
//
//  Created by linchaolin on 29/10/2015.
//  Copyright © 2015 linchaolin. All rights reserved.
//

#import "NSString_MD5.h"
@implementation NSString (md5)

-(NSString *) md5HexDigest
{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

@end
