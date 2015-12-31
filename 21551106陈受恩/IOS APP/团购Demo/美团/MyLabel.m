//
//  MyLabel.m
//  美团
//
//  Created by 陈受恩 on 15/12/14.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    //获取上下文CGContextRef ＋设置画线起点画线终点+渲染到屏幕
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, rect.size.height/2);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height/2);
    CGContextStrokePath(context);
    
    
}


@end
