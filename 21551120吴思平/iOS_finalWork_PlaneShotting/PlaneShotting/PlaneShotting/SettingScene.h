//
//  SettingScene.h
//  PlaneShotting
//
//  Created by Anglet on 15/12/29.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "CCScene.h"
#import "cocos2d.h"
#import "GameManager.h"

@interface SettingScene : CCScene
{
    float voice;
    CCLabelTTF *voiceLabel;
    float bgVoice;
    CCLabelTTF *bgVoiceLabel;
    GameManager *manager;
    OALSimpleAudio *testAudio;
}

- (instancetype)init;
- (void) voiceUp;
- (void) voiceDown;
- (void) bgVoiceUp;
- (void) bgVoiceDown;
- (void) backToStartScene;

@end
