//
//  YXQWaterFallCell.m
//  PoseCamera
//
//  Created by YXQ on 15/12/28.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import "YXQWaterFallCell.h"

@implementation YXQWaterFallCell
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}
@end
