//
//  UIButton+Extension.m
//  CloudMusic
//
//  Created by LiDan on 15/12/13.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)


-(void)setNormalName:(NSString *)imageName highlightName:(NSString *)highlightImageName;
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:highlightImageName] forState:UIControlStateHighlighted];
}

@end
