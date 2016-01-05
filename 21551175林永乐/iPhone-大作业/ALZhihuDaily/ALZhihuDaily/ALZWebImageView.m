//
//  ALZWebImageView.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/4.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZWebImageView.h"
#import <UIImageView+AFNetworking.h>

@interface ALZWebImageView ()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ALZWebImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self addSubview:self.imageView];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)]];
    }
    return self;
}

- (void)tapGesture:(id)sender{
    self.hidden = YES;
}

- (void)setImageWithUrl:(NSString *)urlString{
    self.imageView.image = nil;
    NSURL *url = [NSURL URLWithString:urlString];
    [self.imageView setImageWithURL:url];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.frame];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end
