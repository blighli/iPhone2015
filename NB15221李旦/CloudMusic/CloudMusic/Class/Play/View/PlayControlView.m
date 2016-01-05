//
//  PlayMainView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/11.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayMainControlView.h"
#import "PlayControlView.h"
#import "PlayOtherControlView.h"
#import "PlayScrollView.h"
#import "PlayTopView.h"
#import "SoundLrcView.h"
#import "CloudMusic.pch"

@interface PlayControlView()

@property (nonatomic,weak) PlayOtherControlView *playOtherControlView;
@property (nonatomic,weak) UIImageView* crossView;
@property (nonatomic,weak) PlayScrollView *playScrollView;
@property (nonatomic,weak) PlayTopView *playTopView;
@property (nonatomic,weak) SoundLrcView *soundView;
@property (nonatomic,weak) UIImageView * maskView;
@property (nonatomic,assign,getter=isSoundViewChange) BOOL soundViewChange;

@end

@implementation PlayControlView


- (instancetype)initWithFrame:(CGRect)frame
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
    self.playScrollView.albumImageName = albumImageName;
    _albumImageName = albumImageName;
}

-(void)setup
{
    UIImageView *maskView = [[UIImageView alloc]init];
    if (IS_IPHONE_6)
    {
        [maskView setImage:[UIImage imageNamed:@"cm2_play_disc_mask-ip6"]];
    }
    else if (IS_IPHONE_5)
    {
        [maskView setImage:[UIImage imageNamed:@"cm2_play_disc_mask-ip5"]];
    }
    else
    {
        [maskView setImage:[UIImage imageNamed:@"cm2_play_disc_mask"]];
    }
    
    self.maskView = maskView;
    
    PlayOtherControlView *playOtherControlView = [[PlayOtherControlView alloc]init];
    self.playOtherControlView = playOtherControlView;
    
    
    // 下端阴影
    UIImageView *crossView = [[UIImageView alloc]init];
    [crossView setImage:[UIImage imageNamed:@"cm2_play_crossline"]];
    self.crossView = crossView;
    
    
    PlayScrollView *playScrollView = [[PlayScrollView alloc]init];
    self.playScrollView = playScrollView;
    
    PlayTopView *playTopView = [[PlayTopView alloc]init];
    self.playTopView = playTopView;
    
    SoundLrcView *soundView = [[SoundLrcView alloc]init];
    self.soundView = soundView;
    soundView.alpha = 0;

    [self addSubview:maskView];
    [self addSubview:playOtherControlView];
    [self addSubview:playScrollView];
    [self addSubview:soundView];
    [self addSubview:playTopView];
    [self addSubview:crossView];
}

-(BOOL)touchingViewWithPoint:(CGPoint)point
{
    CGRect rects = CGRectMake(0, 0, self.width, self.playOtherControlView.y);
    return CGRectContainsPoint(rects,point);

}

-(void)viewChange:(CGPoint)point
{
    if ([self touchingViewWithPoint:point])
    {
        if (!self.isSoundViewChange)
        {
            [UIImageView animateWithDuration:0.5 animations:^{
                self.playScrollView.alpha = 0;
                self.playTopView.alpha = 0;
                self.playOtherControlView.alpha = 0;
                self.maskView.alpha = 0;
                self.crossView.alpha = 0;
                self.soundView.alpha = 1;
            }];
            self.soundViewChange = YES;
        }
        else
        {
            [UIImageView animateWithDuration:0.5 animations:^{
                self.playScrollView.alpha = 1;
                self.playTopView.alpha = 1;
                self.playOtherControlView.alpha = 1;
                self.maskView.alpha = 1;
                self.crossView.alpha = 1;
                self.soundView.alpha = 0;
            }];
            self.soundViewChange = NO;
        }
    }

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    //触摸点
    CGPoint point = [touch locationInView:self];
    [self viewChange:(CGPoint)point];

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.crossView.height = self.crossView.image.size.height;
    self.crossView.width = ScreenWidth;
    self.crossView.x = 0;
    self.crossView.y = -self.crossView.height;
    
    self.playOtherControlView.height = 55;
    self.playOtherControlView.width = ScreenWidth;
    self.playOtherControlView.x = 0;
    self.playOtherControlView.y = self.height - self.playOtherControlView.height;
    
    self.playScrollView.x = 0;
    self.playScrollView.y = 34;
    self.playScrollView.width = ScreenWidth;
    self.playScrollView.height = self.height - self.playOtherControlView.height - self.playScrollView.y;
    self.playScrollView.contentSize = CGSizeMake(self.playScrollView.width * 3, 0);
    [self.playScrollView setContentOffset:CGPointMake(self.playScrollView.width, 0)];
    
    self.soundView.x = 0;
    self.soundView.y = 0;
    self.soundView.width = self.width;
    self.soundView.height = self.height;
    
    self.playTopView.x = 0;
    self.playTopView.y = 0;
    self.playTopView.width = ScreenWidth;
    self.playTopView.height = 200;
    
    self.maskView.x = 0;
    self.maskView.y = -64;
    self.maskView.width = ScreenWidth;
    self.maskView.height = ScreenHeight;
}

@end
