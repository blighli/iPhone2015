//
//  PlayDiscView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/12.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayDiscView.h"
#import "CloudMusic.pch"

@interface PlayDiscView()

@property (nonatomic,weak) UIImageView * bgView;

@end

@implementation PlayDiscView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setAlbumImageName:(NSString *)albumImageName
{
    [self.bgView setImage:[UIImage imageNamed:albumImageName]];
    _albumImageName = albumImageName;
}

-(void)setup
{
    if(IS_IPHONE_6)
    {
        [self setImage:[UIImage imageNamed:@"cm2_play_disc-ip6"]];
    }
    else
    {
        [self setImage:[UIImage imageNamed:@"cm2_play_disc"]];
    }

    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.clipsToBounds = YES;
    
    [self addSubview:bgView];
    [self sendSubviewToBack:bgView];
    
    self.bgView = bgView;
    self.userInteractionEnabled = YES;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.bgView.size = CGSizeMake(self.size.width - 104, self.size.height - 104);
    self.bgView.x = (self.width - self.bgView.width) / 2;
    self.bgView.y = (self.height - self.bgView.height) / 2;
    self.bgView.layer.cornerRadius = CGRectGetHeight(self.bgView.bounds)/2;
    self.bgView.layer.masksToBounds = YES;

}

@end
