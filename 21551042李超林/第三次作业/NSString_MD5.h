//
//  NSString_NSString_MD5.h
//  ThirdAssignment
//
//  Created by linchaolin on 29/10/2015.
//  Copyright © 2015 linchaolin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (md5)
-(NSString *) md5HexDigest;
@end
