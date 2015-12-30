//
//  MTCenterLineLabel.m
//  美团HD
//
//  Created by zhuzhu on 15/11/24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "MTCenterLineLabel.h"

@implementation MTCenterLineLabel

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIRectFill(CGRectMake(0, rect.size.height * 0.5, rect.size.width, 1));
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 画线
    // 设置起点
//    CGContextMoveToPoint(ctx, 0, rect.size.height * 0.5);
//    // 连线到另一个点
//    CGContextAddLineToPoint(ctx, rect.size.width, rect.size.height * 0.5);
//    // 渲染
//    CGContextStrokePath(ctx);
}

@end
