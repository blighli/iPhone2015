//
//  InsertInfoServiceImpl.h
//  ThirdAssignment
//
//  Created by linchaolin on 28/10/2015.
//  Copyright © 2015 linchaolin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InsertInfoService.h"

#define INSERT_INFO_USER_DEFAULTS_KEY @"InsertInfoServiceImpl.UserDefaults"

/**
 * A insert info service implementation with NSUserDefaults.
 */
@interface InsertInfoServiceImpl : NSObject<InsertInfoService>

@end
