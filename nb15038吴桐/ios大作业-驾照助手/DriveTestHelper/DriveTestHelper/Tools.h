//
//  Tools.h
//  DriveTestHelper
//
//  Created by wp on 15/12/18.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject
+(NSArray *)getAnswerWithString:(NSString *)str;
+(CGSize)getSizeWithString:(NSString *)str with:(UIFont *)fount withSize:(CGSize)size;//自适应
@end
