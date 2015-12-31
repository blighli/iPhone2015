//
//  PlayMainView.h
//  CloudMusic
//
//  Created by LiDan on 15/12/11.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CloudMusic.pch"

typedef enum
{
    playTypeLoop = 0,
    playTypeOne = 1,
    playTypeShuffle = 2
}playType;

@class PlayMainControlView;

@protocol PlayMainControlDelegate <NSObject>

-(void)playMainControl:(PlayMainControlView*)mainControlView withBtnType:(playBtnType)type;

@end

@interface PlayMainControlView : UIView

@property(nonatomic,weak)id<PlayMainControlDelegate> delegate;
@property (nonatomic,assign,getter=isPlaying) BOOL playing;//播放状态
@property (nonatomic,copy) NSString * totalTimeString;
@property (nonatomic,assign) playType playingType;

@end
