//
//  MainGameScene.h
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "Plane.h"
#import "GameManager.h"

@interface MainGameScene : CCScene
{
    Plane* hero;
    GameManager* manager;
    CGSize win_size;
    
    //子弹的类型
    int bulletType;
    
    //Label
    CCLabelTTF *scoreLabel;
    CCLabelTTF *hpLabel;
    
    //背景
    CCSprite* background1;
    CCSprite* background2;
    
    float voice;
    float bgVoice;
}

- (instancetype) initWithPlane:(int)index;
//添加敌机
- (void) addEnemy;
//添加子弹
- (void) addBullet;
//碰撞检测
- (void) collideTest;

@end
