//
//  SceneManager.m
//  0°—004
//
//  Created by huangbingjie on 13-8-7.
//
//

#import "SceneManager.h"
@interface SceneManager()
+(void) go: (CCLayer *) layer;
+(CCScene *) wrap: (CCLayer *) layer;

@end

@implementation SceneManager

+(void) goGameScene {
    [SceneManager go:[MainScene node]];
}




+(void)goLevelResult{
    
    [SceneManager go:[LevelResult node]];
}

+(void) go: (CCLayer *) layer {
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [SceneManager wrap:layer];
    
    
    if ([director runningScene]) {
        
        [director replaceScene:newScene];
        
        
    }
    else {
        [director runWithScene:newScene];
    }
}



+(CCScene *) wrap: (CCLayer *) layer {
    CCScene *newScene = [CCScene node];
    [newScene addChild: layer z:1];
    
    GameHUD * myGameHUD = [GameHUD sharedHUD];
    [myGameHUD.parent removeChild:myGameHUD cleanup:YES];
	[newScene addChild:myGameHUD z:2];
    DataModel *m = [DataModel getModel];
	m._gameLayer = layer;
	m._gameHUDLayer = myGameHUD;
    //[GameHUD resetGameHUD];
    
    return newScene;
}


@end