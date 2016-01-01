//
//  NSString+Extension.h
//  蛋蛋微博
//
//  Created by greeting on 15/8/27.
//  Copyright (c) 2015年 greeting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extension)
- (CGSize)sizeWithLabelFont:(UIFont *)font maxW:(CGFloat)maxW;

- (CGSize)sizeWithLabelFont:(UIFont *)font;
@end
