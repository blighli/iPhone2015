//
//  UIBarButtonItem+Extension.h
//  蛋蛋微博
//
//  Created by LiDan on 15/8/10.
//  Copyright (c) 2015年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
