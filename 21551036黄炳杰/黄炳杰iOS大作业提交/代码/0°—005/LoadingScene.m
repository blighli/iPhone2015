//
//  LoadingScene.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "LoadingScene.h"

#import "SimpleAudioEngine.h"

//下一个想转换的场景
#import "IntroLayer.h"
#import "StartGameScene.h"

#import "GameData.h"

//#import "Constants.h"
@implementation LoadingScene
+(CCScene *)scene
{
    
    
    CCScene *scene = [CCScene node];
    
    LoadingScene *layer = [LoadingScene node];
    [scene addChild:layer];
    return scene;
}




-(void)getScreenSize{
    screenSize = [CCDirector sharedDirector].winSize;
}



//初始化



-(id)init
{
    if ((self = [super init])) {
        
        screenSize = [[CCDirector sharedDirector] winSize];
        //[self getScreenSize];
        CCSprite *loadingBg = [CCSprite spriteWithFile:@"bg_load.png"];
        
        loadingBg.position = ccp(screenSize.width / 2, screenSize.height / 2);
        loadingBg.anchorPoint = ccp(0.284 , 0.884);
        //loadingBg.anchorPoint = ccp(0, 0);
        [self addChild:loadingBg];
        
        
        //加载资源
        progress = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"progressbar.png"]];//进度条
        [progress setPercentage:0.0f];
        //progress.scale = 0.5f;
        
        //暂定  以后修改
        progress.midpoint = ccp(0, 0.5);
        progress.barChangeRate = ccp(1, 0);//进度条如何缩放
        progress.type = kCCProgressTimerTypeBar;//条形  还有绕圆心转动的动画kCCProgressTimerTypeRadial
        [progress setPosition:ccp(screenSize.width * 0.25, screenSize.height * 0.1)];
        //
        [progress setAnchorPoint:ccp(0, 0.5)];
        [self addChild:progress];
        
        
        
        //CCLabelTTF *loadingText = [CCLabelTTF labelWithString:@"Loading..." fontName:@"Arial" fontSize:20];
        //loadingText.position = ccpAdd(progress.position, ccp(0, 50));
        //loadingText.position = ccp(screenSize.width / 2, screenSize.height / 2);
        
        //[self addChild:loadingText];
        
        
    }
    
    return self;
}

-(void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    
    NSString *path = [[CCFileUtils sharedFileUtils] fullPathFromRelativePath:@"preLoadAssetManifest.plist"];
    NSDictionary *manifest = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *spriteSheets = [manifest objectForKey:@"SpriteSheets"];
    NSArray *images       = [manifest objectForKey:@"Images"];
    NSArray *soundFX      = [manifest objectForKey:@"SoundFX"];
    NSArray *music        = [manifest objectForKey:@"Music"];
    NSArray *assets       = [manifest objectForKey:@"Assets"];
    
    assetCount = ([spriteSheets count] + [images count] + [soundFX count] + [music count] + [assets count]);
    progressInterval = 100.0 / (float)assetCount;//备注
    
    
    if (soundFX) {
        [self performSelectorOnMainThread:@selector(loadSounds:) withObject:soundFX waitUntilDone:YES];
    }
    if (images) {
        [self performSelectorOnMainThread:@selector(loadImages:) withObject:images waitUntilDone:YES];
    }
    if (music) {
        [self performSelectorOnMainThread:@selector(loadMusic:) withObject:music waitUntilDone:YES];
    }
    if (assets) {
        [self performSelectorOnMainThread:@selector(loadAsset:) withObject:assets waitUntilDone:YES];
    }
    if (spriteSheets) {
        [self performSelectorOnMainThread:@selector(loadSpriteSheets:) withObject:spriteSheets waitUntilDone:YES];
    }
    
}



-(void) loadMusic:(NSArray *)musicFiles
{
    CCLOG(@"Start loading music");
    for (NSString *music in musicFiles) {
        [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:music];
        [self progressUpdate];
    }
}


-(void) loadSounds:(NSArray *)soundClips
{
    CCLOG(@"Start loading sounds");
    for (NSString *soundClip in soundClips) {
        [[SimpleAudioEngine sharedEngine]preloadEffect:soundClip];
        [self progressUpdate];
    }
}

-(void) loadSpriteSheets:(NSArray *)spriteSheets
{
    for (NSString *spriteSheet in spriteSheets) {
        [[CCSpriteFrameCache sharedSpriteFrameCache]  addSpriteFramesWithFile:spriteSheet];
        [self progressUpdate];
    }
}

-(void) loadImages:(NSArray *)images
{
    CCLOG(@"Start loading images");
    for (NSString *image in images) {
        
        //*************
        [[CCTextureCache sharedTextureCache]addImage:image];//（纹理缓存）作为单例使用，用于加载和管理纹理。一旦纹理加载完成，下次使用时可使用它返回之前加载的纹理，从而减少对GPU和CPU内存的占用。
        [self progressUpdate];
    }
}

-(void) loadAsset:(NSArray *)assets
{
    CCLOG(@"Start loading assets");
    for (NSString *asset in assets) {
        [self progressUpdate];
    }
    [self progressUpdate];
    
}

-(void)progressUpdate
{
    if (-- assetCount) {
        //显示进度条
        [progress setPercentage:(100.0f - (progressInterval *assetCount))];
    }
    else{
        
        
        CCProgressFromTo *ac = [CCProgressFromTo actionWithDuration:0.5 from:progress.percentage to:100];
        CCCallBlock *callbak = [CCCallBlock actionWithBlock:^(){
            [self loadingComplete];
            CCLOG(@"All done loading assets.");
        }];
        id action = [CCSequence actions:ac,callbak, nil];
        [progress runAction:action];
        
    }
}


-(void) loadingComplete{
    CCDelayTime *delay = [CCDelayTime actionWithDuration:2.0f];
    CCCallBlock *swapScene =[CCCallBlock actionWithBlock:^(void){
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.01f scene:[StartGameScene scene]]];
    }];
    CCSequence *seq = [CCSequence actions:delay,swapScene, nil];
    [self runAction:seq];
}

@end
