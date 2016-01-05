//
//  GameHUD.h
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "cocos2d.h"


@interface GameHUD : CCLayer {
	CCSprite * background;//HUD背景
	
	CCSprite * selSpriteRange;//拖动时复制的范围
    CCSprite * selSprite;//拖动时复制的炮塔
    CCSprite * selSprite2;
    //CCSprite * baseTower;
    int resources;//金币数
    CCLabelTTF *resourceLabel; //显示的金币lable
    CCLabelTTF *waveCountLabel;//波数的lable
    CCLabelTTF *baseHpLabel;
    //float baseHpPercentage;
   // CCProgressTimer *healthBar;
    int baseHp;
    NSMutableArray * movableSprites;
    NSMutableArray * towerBase;
}
@property (nonatomic,assign) int baseHp;
@property (nonatomic, assign) int resources;
//@property (nonatomic, assign) float baseHpPercentage;
@property (nonatomic, assign) NSMutableArray * movableSprites;
@property (nonatomic,assign) NSMutableArray *towerBase;
+ (GameHUD *)sharedHUD;
-(void) updateBaseHp:(int)amount;
-(void) updateResources:(int)amount;
-(void) updateResourcesNom;
-(void) updateWaveCount;

+(void) resetGameHUD;
-(void) resetGameHUDLayer;


@end
