//
//  PlaySlider.m
//  CloudMusic
//
//  Created by LiDan on 15/12/12.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlaySlider.h"
#import "UIImage+ResizeImage.h"
#import "CloudMusic.pch"

@interface PlaySlider()



@end

@implementation PlaySlider

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setup
{
    [self setThumbImage:[UIImage imageNamed:@"cm2_fm_playbar_btn"] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[UIImage resizeImageWihtImageName:@"cm2_fm_playbar_ready"] forState:UIControlStateNormal];
    [self setMinimumTrackImage:[UIImage resizeImageWihtImageName:@"cm2_fm_playbar_curr"] forState:UIControlStateNormal];
    UIImageView *dotView = [[UIImageView alloc]init];
    [dotView setImage:[UIImage imageNamed:@"cm2_fm_playbar_btn_dot"]];
    [self addSubview:dotView];
    dotView.size = dotView.image.size;
    dotView.y = (10 - dotView.size.height ) / 2;
    self.dotView = dotView;

}


-(CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
    rect.origin.x = rect.origin.x - 3.5 ;
    rect.size.width=rect.size.width + 7;
    return CGRectInset ([super thumbRectForBounds:bounds trackRect:rect value:value], 0 , 0);
}

@end
