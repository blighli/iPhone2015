//
//  LMPlayerToolBar.h
//  音乐播放器
//
//  Created by 张焕 on 12/31/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LMMusic, LMPlayerToolBar;
typedef enum {
    BtnTypePlay,
    BtnTypePause,
    BtnTypeNext,
    BtnTypePrev
}BtnType;
@protocol LMPlayerToolBarDelegate <NSObject>

-(void) playerToolBar:(LMPlayerToolBar*)toolbar btnClickWithType:(BtnType)btnType;

@end

@interface LMPlayerToolBar : UIView
+(instancetype)playerToolBar;
@property(strong, nonatomic)LMMusic *playingMusic;
@property(nonatomic, weak)id<LMPlayerToolBarDelegate> delegate;
@property (assign, nonatomic, getter=isPlaying)BOOL playing;
@end
