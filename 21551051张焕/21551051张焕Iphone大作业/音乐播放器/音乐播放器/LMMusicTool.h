//
//  LMMusicTool.h
//  音乐播放器
//
//  Created by 张焕 on 12/31/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import <AVFoundation/AVFoundation.h>

@class LMMusic;
@interface LMMusicTool : NSObject
singleton_interface(LMMusicTool)
@property(nonatomic, strong) AVAudioPlayer *player;
-(void) prepareToPlayWithMusic:(LMMusic*) music;
-(void) play;
-(void) pause;
@end
