//
//  NSString_NSString_MD5.h
//  ThirdAssignment
//
//  Created by Xin on 29/10/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "InfoModel.h"

@interface InfoModel (md5)

- (void)generateUniqueID;

@end
