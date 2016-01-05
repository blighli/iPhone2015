//
//  PlayTopView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/12.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayTopView.h"
#import "CloudMusic.pch"

@interface PlayTopView()

@property (nonatomic,weak) UIImageView * playNeedle;
@property (nonatomic,assign,getter=isSetted) BOOL setPosition;
@property (nonatomic,assign,getter=isFirstRotate) BOOL firstRotate;
@property (nonatomic,assign,getter=isStop) BOOL stop;
@property (nonatomic,assign,getter=isScroll) BOOL scroll;
@end


@implementation PlayTopView

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
    UIImageView *playNeedle = [[UIImageView alloc]init];
    self.userInteractionEnabled = YES;
    
    if(IS_IPHONE_6)
    {
        [playNeedle setImage:[UIImage imageNamed:@"cm2_play_needle_play-ip6"]];
    }
    else if(IS_IPHONE_5)
    {
        [playNeedle setImage:[UIImage imageNamed:@"cm2_play_needle_play-ip5"]];
    }
    else
    {
        [playNeedle setImage:[UIImage imageNamed:@"cm2_play_needle_play"]];
    }
    
    playNeedle.layer.anchorPoint = CGPointMake(30 / playNeedle.image.size.width, 30 / playNeedle.image.size.height);
    self.playNeedle = playNeedle;
    [self addSubview:playNeedle];
    
    self.clipsToBounds = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startToRotate) name:@"SendPlayMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopToRotate) name:@"SendPauseMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playNextMusic) name:@"SendChangeMusic" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollPause) name:@"sendScrollPause" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollContinue) name:@"sendScrollContinue" object:nil];
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];

    if(!self.isSetted)
    {
        self.playNeedle.size = self.playNeedle.image.size;
        self.playNeedle.x = ScreenWidth/2 - 28;
        self.playNeedle.y = -30;
        self.setPosition = YES;
    }

}

-(void)startToRotate
{
    if(!self.isFirstRotate)
    {
        self.playNeedle.transform = CGAffineTransformMakeRotation(M_PI * - 30 / 180);
        [UIImageView animateWithDuration:0.8 animations:^{
            self.playNeedle.transform = CGAffineTransformRotate(self.playNeedle.transform, M_PI * 30 / 180);
        }];
        self.firstRotate = YES;
    }
    if (self.isScroll)
    {
        self.scroll = NO;
        return ;
    }
    if (self.stop)
    {
        self.playNeedle.transform = CGAffineTransformMakeRotation(M_PI * - 30 / 180);
        [UIImageView animateWithDuration:0.8 animations:^{
            self.playNeedle.transform = CGAffineTransformRotate(self.playNeedle.transform, M_PI * 30 / 180);
        }];
        self.stop = NO;
    }
}

-(void)stopToRotate
{
    if (!self.stop)
    {
        [UIImageView animateWithDuration:0.8 animations:^{
            self.playNeedle.transform = CGAffineTransformRotate(self.playNeedle.transform, M_PI * -30 / 180);
        }];
        self.stop = YES;
    }

}

-(void)playNextMusic
{
    if (self.stop)
    {
        [self startToRotate];
        return ;
    }
    [UIImageView animateWithDuration:0.4 animations:^{
        self.playNeedle.transform = CGAffineTransformRotate(self.playNeedle.transform, M_PI * -25 / 180);
    } completion:^(BOOL finished) {
        [UIImageView animateWithDuration:0.4 animations:^{
            self.playNeedle.transform = CGAffineTransformRotate(self.playNeedle.transform, M_PI * 25 / 180);
        }];
    }];
    self.scroll = YES;
}

-(void)scrollContinue
{
    if ([MusicTool sharedMusicTool].isPlaying)
    {
        [self startToRotate];
    }
    
}

-(void)scrollPause
{
    [self stopToRotate];
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SendPlayMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SendPauseMusicInfo" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SendChangeMusic" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"sendScrollPause" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"sendScrollContinue" object:nil];
}

@end
