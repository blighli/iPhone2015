

#import "GamePause.h"
#import "CCTouchDispatcher.h"
#import "LevelSelect.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "MainScene.h"
//#import "Constants.h"
#import "SceneManager.h"


@implementation GamePause


@synthesize delegate;

+ (id) layerWithColor:(ccColor4B)color delegate:(id)_delegate

{
    
    return [[[self alloc] initWithColor:color delegate:_delegate] autorelease];
    
}

- (id) initWithColor:(ccColor4B)c delegate:(id)_delegate {
    
    self = [super initWithColor:c];
    
    if (self != nil) {
        
        
        delegate = _delegate;
        
        [self pauseDelegate];
        
        [self addBg];
        
        [self createPausedMenu];


    }
    
    return self;
    
}



//添加背景


-(void)addBg{
    
    screenSize = [CCDirector sharedDirector].winSize;
    
    bg = [CCSprite spriteWithFile:@"bg_pause.png"];
    bg.position = ccp(screenSize.width/2,screenSize.height/2);
    [self addChild:bg z:-1];
}


-(void)createPausedMenu{
//创建暂停画面

        CGSize size = [CCDirector sharedDirector].winSize;

        CCLabelTTF *LablePlay = [CCLabelTTF labelWithString:@"继续" fontName:@"MarkerFelt-Thin" fontSize:12];
        LablePlay.color = ccc3(0, 0, 0);
        CCLabelTTF *LableSelect = [CCLabelTTF labelWithString:@"选关" fontName:@"MarkerFelt-Thin" fontSize:12];
        LableSelect.color = ccc3(0, 0, 0);
        CCLabelTTF *LableReplay = [CCLabelTTF labelWithString:@"重玩" fontName:@"MarkerFelt-Thin" fontSize:12];
    LableReplay.color = ccc3(0, 0, 0);
        CCMenuItemImage *buttonPlay = [CCMenuItemImage itemWithNormalImage:@"game_off.png" selectedImage:@"game_off.png" target:self selector:@selector(resumeCurrentLevel)];
        CCMenuItemImage *buttonMenu = [CCMenuItemImage itemWithNormalImage:@"button_select.png" selectedImage:@"button_select.png" target:self selector:@selector(goLevelSelection)];
        CCMenuItemImage *buttonReplay = [CCMenuItemImage itemWithNormalImage:@"button_replay.png" selectedImage:@"button_replay.png" target:self selector:@selector(replayCurretLevel)];

        buttonPlay.position = ccp(size.width * 0.5,size.height * 0.55);
        buttonMenu.position = ccp(size.width * 0.3,size.height * 0.55);
        buttonReplay.position = ccp(size.width * 0.7,size.height * 0.55);
    
        LablePlay.position = ccpAdd(buttonPlay.position, ccp(0,-30));
        LableSelect.position = ccpAdd(buttonMenu.position, ccp(0,-30));
        LableReplay.position = ccpAdd(buttonReplay.position, ccp(0,-30));
        CCMenu *menu = [CCMenu menuWithItems:buttonMenu,buttonPlay,buttonReplay, nil];

        menu.position = CGPointZero;
        [self addChild:menu z:1];
        [self addChild:LablePlay z:2];
        [self addChild:LableReplay z:2];
        [self addChild:LableSelect z:2];
}


-(void)resumeCurrentLevel{
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    
        [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.1],[CCCallFunc actionWithTarget:self selector:@selector(doResume:)] ,nil]];
}

-(void)replayCurretLevel{
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    
    [SceneManager goGameScene];
    [[GameHUD sharedHUD]resetGameHUDLayer];
    [MainScene resetGame];
}


-(void)goLevelSelection{
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    
    
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    
    CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[LevelSelect scene]];
    [[CCDirector sharedDirector]replaceScene:trans];
}



-(void)pauseDelegate

{
    
        if([delegate respondsToSelector:@selector(pauseLayerDidPause)])
        
            [delegate pauseLayerDidPause];
    
            [delegate onExit];
    
            [delegate.parent addChild:self z:10];
    
}

-(void)doResume: (id)sender

{
    
        [delegate onEnter];
    
        if([delegate respondsToSelector:@selector(pauseLayerDidUnpause)])
        
            [delegate pauseLayerDidUnpause];
    
            [self.parent removeChild:self cleanup:YES];
    
}

-(void)dealloc

{
    
        [super dealloc];
    
}

@end
