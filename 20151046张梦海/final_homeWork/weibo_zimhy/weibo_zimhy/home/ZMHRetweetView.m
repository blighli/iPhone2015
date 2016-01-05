//
//  ZMHRetweetView.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHRetweetView.h"

#import "ZMHStatus.h"
#import "ZMHStatusFrame.h"
#import "ZMHPhotosView.h"



@interface ZMHRetweetView ()

// 昵称
@property (nonatomic, weak) UILabel *nameView;


// 正文
@property (nonatomic, weak) UILabel *textView;

// 配图
@property (nonatomic, weak) ZMHPhotosView *photosView;

@end


@implementation ZMHRetweetView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 添加所有子控件
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_retweet_background"];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    
    // 昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.textColor = [UIColor blueColor];
    nameView.font = ZMHNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    
    // 正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = ZMHTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    
    // 配图
    ZMHPhotosView *photosView = [[ZMHPhotosView alloc] init];
    [self addSubview:photosView];
    _photosView = photosView;
}

- (void)setStatusF:(ZMHStatusFrame *)statusF
{
    _statusF = statusF;
    
    
    ZMHStatus *status = statusF.status;
    // 昵称
    _nameView.frame = statusF.retweetNameFrame;
    _nameView.text = status.retweetName;
    
    // 正文
    _textView.frame = statusF.retweetTextFrame;
    _textView.text = status.retweeted_status.text;
    
    // 配图
    _photosView.frame = statusF.retweetPhotosFrame;
    
    // 注意：这里一定要转让转发微博的配图数
    _photosView.pic_urls = status.retweeted_status.pic_urls;
    
}


@end
