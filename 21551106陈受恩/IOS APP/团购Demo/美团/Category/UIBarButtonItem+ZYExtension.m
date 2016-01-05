//
//  UIBarButtonItem+ZYExtension.m
//  团购HD
//
//  Created by 王志盼 on 15/8/11.
//  Copyright (c) 2015年 王志盼. All rights reserved.
//

#import "UIBarButtonItem+ZYExtension.h"

@implementation UIBarButtonItem (ZYExtension)
+ (UIBarButtonItem *)barButtonItemWithTarget:(id)target action:(SEL)action normalImage:(NSString *)normalImage highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, btn.currentImage.size.width, btn.currentImage.size.height);
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
