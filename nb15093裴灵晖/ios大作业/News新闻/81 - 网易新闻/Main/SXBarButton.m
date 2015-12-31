//
//  SXBarButton.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import "SXBarButton.h"
#import "UIView+Frame.h"

@implementation SXBarButton

- (void)setHighlighted:(BOOL)highlighted
{
    // 目的就是重写取消高亮显示
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.titleLabel.x = self.imageView.x;
    self.imageView.y = 5;
    self.imageView.width = 25;
    self.imageView.height = 25;
    self.imageView.x = (self.width - self.imageView.width)/2.0;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.x = self.imageView.x - (self.titleLabel.width - self.imageView.width)/2.0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + 2;
    
    //设置字体
    self.titleLabel.font = [UIFont fontWithName:@"HYQiHei" size:10];
    self.titleLabel.shadowColor = [UIColor clearColor];
    
//    self.backgroundColor = [UIColor redColor];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
