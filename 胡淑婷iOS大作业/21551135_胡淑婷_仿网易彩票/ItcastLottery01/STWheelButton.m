//
//  STWheelButton.m
//  转盘
//
//  Created by 123 on 15/12/4.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STWheelButton.h"

@implementation STWheelButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageW=40;
    CGFloat imageH=47;
    CGFloat imageX=(contentRect.size.width-imageW)*0.5;
    CGFloat imageY=20;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}
@end
