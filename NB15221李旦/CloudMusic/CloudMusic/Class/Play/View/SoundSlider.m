//
//  SoundSlider.m
//  CloudMusic
//
//  Created by LiDan on 15/12/23.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "SoundSlider.h"
#import "UIImage+ResizeImage.h"
#import "CloudMusic.pch"

@implementation SoundSlider

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
    [self setThumbImage:[UIImage imageNamed:@"cm2_mv_playbar_btn_ver"] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[UIImage resizeImageWihtImageName:@"cm2_fm_playbar_bg"] forState:UIControlStateNormal];
    [self setMinimumTrackImage:[UIImage resizeImageWihtImageName:@"cm2_fm_playbar_ready"] forState:UIControlStateNormal];
}


-(CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
    rect.origin.x = rect.origin.x - 2.5 ;
    rect.size.width=rect.size.width + 5;
    return CGRectInset ([super thumbRectForBounds:bounds trackRect:rect value:value], 0 , 0);
}
@end
