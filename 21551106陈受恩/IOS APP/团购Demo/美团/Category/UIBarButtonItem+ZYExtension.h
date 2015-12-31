//
//  UIBarButtonItem+ZYExtension.h
//  团购HD
//
//  Created by 王志盼 on 15/8/11.
//  Copyright (c) 2015年 王志盼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZYExtension)
+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target action:(SEL)action normalImage:(NSString *)normalImage highImage:(NSString *)highImage;
@end
