//
//  GameHUD.m
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "GameHUD.h"
#import "DataModel.h"

#import "MainScene.h"
#import "LevelResult.h"
#import "GameData.h"
@implementation GameHUD
@synthesize baseHp = baseHp;
@synthesize resources = resources;
//@synthesize baseHpPercentage = baseHpPercentage;
@synthesize movableSprites = movableSprites;
@synthesize towerBase = towerBase;
int waveCount;

//**
bool resetGameHUD;
//**

static GameHUD *_sharedHUD = nil;

+ (GameHUD *)sharedHUD
{
	@synchronized([GameHUD class])
	{
		if (!_sharedHUD)
			[[self alloc] init];
		return _sharedHUD;
	}
	// to avoid compiler warning
	return nil;
}

+(id)alloc
{
	@synchronized([GameHUD class])
	{
		NSAssert(_sharedHUD == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedHUD = [super alloc];
		return _sharedHUD;
	}
	// to avoid compiler warning
	return nil;
}

-(id) init
{
	if ((self=[super init]) ) {
		
		CGSize winSize = [CCDirector sharedDirector].winSize;

        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
       /* background = [CCSprite spriteWithFile:@"game_hud.png"];
        background.anchorPoint = ccp(0,0);
        [self addChild:background];*/
        float h=winSize.height;
        float w=winSize.width;
        CCLOG(@"/*/*/*/*/*//*/*-----h %f     w %f",h,w);
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_Default];
		
        movableSprites = [[NSMutableArray alloc] init];
        towerBase = [[NSMutableArray alloc] init];
        NSArray *images = [NSArray arrayWithObjects:@"danpao1.png", @"jiansu1.png", @"shuangpao1.png", @"sanpao1.png",@"wudi1.png",nil];
        NSArray *images2 = [NSArray arrayWithObjects:@"danpaojizuo.png",@"jiansujizuo.png",@"shuangpaojizuo.png",@"sanpaojizuo.png",@"wudijizuo.png", nil];
        for(int i = 0; i < images.count; ++i) {
            NSString *image = [images objectAtIndex:i];
            NSString *image2 = [images2 objectAtIndex:i];
            //objectAtIndex 只适用于集合（数组）。可根据索引获取对象
            CCSprite *sprite = [CCSprite spriteWithFile:image];
            CCSprite *sprite2 = [CCSprite spriteWithFile:image2];
            float offsetFraction = ((float)(i+1))/(images.count+1);
            sprite.position = ccp(winSize.width*offsetFraction, 35);
            float offsetFraction2 = ((float)(i+1))/(images.count+1);
            sprite2.position = ccp(winSize.width*offsetFraction2, 35);
            
            sprite.tag = i+1;//屏幕下方的基座炮塔tag值，设定为1~5
            sprite2.tag = i+1;//这里是炮塔的基座，tag也设定为1~5
            printf("tag %i", sprite.tag);
            [self addChild:sprite z:2];
            [self addChild:sprite2 z:1];
            [movableSprites addObject:sprite];
            [towerBase addObject:sprite2];
            //设置塔的价格
            CCLabelTTF *towerCost = [CCLabelTTF labelWithString:@"$" fontName:@"Marker Felt" fontSize:10];
            towerCost.position = ccp(winSize.width*offsetFraction, 15);
            towerCost.color = ccc3(0, 0, 0);
            [self addChild:towerCost z:1];
            
            //Set cost values
            switch (i) {
                case 0:
                    [towerCost setString:[NSString stringWithFormat:@"$ 25"]];
                    break;
                case 1:
                    [towerCost setString:[NSString stringWithFormat:@"$ 35"]];
                    break;
                case 2:
                    [towerCost setString:[NSString stringWithFormat:@"$ 65"]];
                    break;
                case 3:
                    [towerCost setString:[NSString stringWithFormat:@"$ 75"]];
                    break;
                case 4:
                    [towerCost setString:[NSString stringWithFormat:@"$ 150"]];
                    break;
                default:
                    break;
            }
        }
        
        
        
        
        // Set up Resources and Resource label
        resources = 100;
        self->resourceLabel = [CCLabelTTF labelWithString:@"Money $100" dimensions:CGSizeMake(150, 25) hAlignment:NSTextAlignmentRight fontName:@"Marker Felt" fontSize:20];
        resourceLabel.position = ccp(30, (winSize.height - 15));
        resourceLabel.color = ccc3(255,80,20);
        [self addChild:resourceLabel z:1];
        
        // Set up BaseHplabel
        baseHp = 10;
        baseHpLabel = [CCLabelTTF labelWithString:@"Base Health 10" dimensions:CGSizeMake(150, 25) hAlignment:NSTextAlignmentRight fontName:@"Marker Felt" fontSize:20];
        baseHpLabel.position = ccp((winSize.width - 185), (winSize.height - 15));
        baseHpLabel.color = ccc3(255,80,20);
        [self addChild:baseHpLabel z:1];
        
        // Set up wavecount label
        waveCount = 1;
        int WCount;
        if ([GameData sharedData].selectedLevel == 1) {
            
            WCount = [GameData sharedData].level1Wave;
            
        }else if ([GameData sharedData].selectedLevel == 2) {
            
            WCount = [GameData sharedData].level2Wave;
            
        }else if ([GameData sharedData].selectedLevel == 3) {
            
            WCount = [GameData sharedData].level3Wave;
            
        }else if ([GameData sharedData].selectedLevel == 4) {
            
            WCount = [GameData sharedData].level4Wave;
            
        }else if ([GameData sharedData].selectedLevel == 5) {
            WCount = [GameData sharedData].level5Wave;
        }
        
        if ([GameData sharedData].selectedChapter == 3) {
            CCLOG(@"wowowow");
            NSString *normal = [NSString stringWithFormat:@"Wave %i",waveCount];
            self->waveCountLabel = [CCLabelTTF labelWithString:normal dimensions:CGSizeMake(150, 25) hAlignment:NSTextAlignmentRight fontName:@"Marker Felt" fontSize:20];
        }else{
            NSString *normal = [NSString stringWithFormat:@"Wave %i / %i",waveCount,WCount];
            self->waveCountLabel = [CCLabelTTF labelWithString:normal dimensions:CGSizeMake(150, 25) hAlignment:NSTextAlignmentRight fontName:@"Marker Felt" fontSize:20];
        }

        //self->waveCountLabel = [CCLabelTTF labelWithString:@"Wave 1/5" dimensions:CGSizeMake(150, 25) hAlignment:NSTextAlignmentRight fontName:@"Marker Felt" fontSize:20];
        waveCountLabel.position = ccp(((winSize.width/2) - 80), (winSize.height - 15));
        waveCountLabel.color = ccc3(100,0,100);
        [self addChild:waveCountLabel z:1];
        
        //***
        //[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
        [[[CCDirector sharedDirector]touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
        //***
        [self schedule:@selector(update:)];
        
        resetGameHUD = NO;
        //***

	}
    
    
    return self;
}

//***
+(void) resetGameHUD
{
    
    resetGameHUD = YES;
    
}
-(void) resetGameHUDLayer
{
    resetGameHUD = NO;
     baseHp = 10;
    [baseHpLabel setString:[NSString stringWithFormat:@"Base Health 10"]];
    waveCount = 1;
    int WCount;
    if ([GameData sharedData].selectedLevel == 1) {
        
        WCount = [GameData sharedData].level1Wave;
        
    }else if ([GameData sharedData].selectedLevel == 2) {
        
        WCount = [GameData sharedData].level2Wave;
        
    }else if ([GameData sharedData].selectedLevel == 3) {
        
        WCount = [GameData sharedData].level3Wave;
        
    }else if ([GameData sharedData].selectedLevel == 4) {
        
        WCount = [GameData sharedData].level4Wave;
        
    }else if ([GameData sharedData].selectedLevel == 5) {
        WCount = [GameData sharedData].level5Wave;
    }
    
    if ([GameData sharedData].selectedChapter == 3) {
        [waveCountLabel setString:[NSString stringWithFormat: @"Wave %i",waveCount]];
    }else{
        NSString *normal = [NSString stringWithFormat:@"Wave %i / %i",waveCount,WCount];
        [waveCountLabel setString:[NSString stringWithFormat: normal,waveCount]];
    }

    //[waveCountLabel setString:[NSString stringWithFormat: @"Wave 1/5"]];
    resources = 100;
    [resourceLabel setString:[NSString stringWithFormat: @"Money $%i",resources]];
}

-(void) update:(ccTime) dt{
    
    if (resetGameHUD == YES) {
        
        CCLOG(@"我3");
        [self resetGameHUDLayer];
    }
    
}

//***




-(void) updateBaseHp:(int)amount{
    baseHp += amount;
    [self->baseHpLabel setString:[NSString stringWithFormat: @"baseHp %i",baseHp]];
    /* if (baseHpPercentage <= 25) {
        [self->healthBar setSprite:[CCSprite spriteWithFile:@"health_bar_red.png"]];
        [self->healthBar setScale:0.5]; 
    
    }*/
    
    if (baseHp <= 0) {
        //Game Over Scenario
        
        
        CCTransitionFade *trans = [CCTransitionSlideInR transitionWithDuration:0.2f scene:[LevelResult scene]];
        [[CCDirector sharedDirector]replaceScene:trans];

        //Implement Game Over Scenario
    }
    
  //  [self->healthBar setPercentage:baseHpPercentage];
}

-(void) updateResources:(int)amount{
    resources += amount;
    [self->resourceLabel setString:[NSString stringWithFormat: @"Money $%i",resources]];
}

/*-(void) updateResourcesNom{
    resources += 1;
    [self->resourceLabel setString:[NSString stringWithFormat: @"Money $%i",resources]];
}*/
-(void) updateWaveCount{
    waveCount++;
    int WCount;
    if ([GameData sharedData].selectedLevel == 1) {
        
        WCount = [GameData sharedData].level1Wave;
        
    }else if ([GameData sharedData].selectedLevel == 2) {
        
        WCount = [GameData sharedData].level2Wave;
        
    }else if ([GameData sharedData].selectedLevel == 3) {
        
        WCount = [GameData sharedData].level3Wave;
        
    }else if ([GameData sharedData].selectedLevel == 4) {
        
        WCount = [GameData sharedData].level4Wave;
        
    }else if ([GameData sharedData].selectedLevel == 5) {
        WCount = [GameData sharedData].level5Wave;
    }

    if ([GameData sharedData].selectedChapter == 3) {
        [self->waveCountLabel setString:[NSString stringWithFormat: @"Wave %i",waveCount]];
    }else{
        NSString *normal = [NSString stringWithFormat:@"Wave %i / %i",waveCount,WCount];
        [self->waveCountLabel setString:[NSString stringWithFormat: normal,waveCount]];
    }
}
/*void HelloWorld::ccTouchesBegan(CCSet *pTouches, CCEvent *pEvent){
 CCTouch *touch = (CCTouch *)pTouches->anyObject();
 CCPoint beginLoc = touch->locationInView();
 beginLoc = CCDirector::sharedDirector()->convertToGL(beginLoc);
 
 CCRect rect = pSprite1->boundingBox();          //得到精灵的矩形框
 int x = rect.origin.x;                          //得到矩形框的左下角x坐标
 int y = rect.origin.y;                          //得到矩形框的左下角x坐标
 int w = rect.size.width;                        //得到矩形框的宽
 int h = rect.size.height;                       //得到矩形框的高
 
 rect = CCRect(210, 130, 20, 20);                //重新设置精灵的矩形框x坐标为210，Y坐标为130，宽w为20，高h为20
 CCLog("%d==%d==%d==%d",x,y,w,h);
 if(CCRect::CCRectContainsPoint(rect, beginLoc)){
 plabel1->setVisible(true);
 }
 } */

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
   //NSLog(@"touch");
    //CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint touchLocation=[touch locationInView:[touch view]];
    touchLocation=[[CCDirector sharedDirector]convertToGL:touchLocation];
    touchLocation=[self convertToNodeSpace:touchLocation];
    CCSprite * newSprite = nil;
    CCSprite * newSprite2 = nil;
    for (CCSprite *sprite in movableSprites) {
        for(CCSprite *sprite2 in towerBase){
            if (CGRectContainsPoint(sprite.boundingBox, touchLocation)&&CGRectContainsPoint(sprite2.boundingBox, touchLocation)) {
                [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
            
			DataModel *m = [DataModel getModel];
			m._gestureRecognizer.enabled = NO;
			
			selSpriteRange = [CCSprite spriteWithFile:@"Range.png"];
			selSpriteRange.scale = 2.1;
			[self addChild:selSpriteRange z:-1];
			selSpriteRange.position = sprite.position;
			
            newSprite = [CCSprite spriteWithTexture:[sprite texture]]; //sprite;
            newSprite2 = [CCSprite spriteWithTexture:[sprite2 texture]];
			newSprite.position = sprite.position;
            newSprite2.position = sprite2 .position;
			selSprite = newSprite;
            selSprite2 = newSprite2;
            selSprite.tag = sprite.tag;
            selSprite2.tag = sprite2.tag;
			[self addChild:newSprite z:2];
            [self addChild:newSprite2 z:1];
			
            break;
        }
    }
    }
    if (CGRectContainsPoint(selSprite.boundingBox, touchLocation)){
        CCLOG(@"touch");

    }
        return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {  
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);    
	
	if (selSprite&&selSprite2) {
		CGPoint newPos = ccpAdd(selSprite.position, translation);
        CGPoint newPos2 = ccpAdd(selSprite2.position,translation);
        selSprite.position = newPos;
        selSprite2.position = newPos;
		selSpriteRange.position = newPos;
		
		DataModel *m = [DataModel getModel];
        if ([GameData sharedData].selectedChapter != 2) {
            CGPoint touchLocationInGameLayer = [m._gameLayer convertTouchToNodeSpace:touch];
            
            BOOL isBuildable = [m._gameLayer canBuildOnTilePosition: touchLocationInGameLayer];
            if (isBuildable) {
                [selSpriteRange setColor:ccc3(0, 225, 0)];
                selSpriteRange.opacity = 255;
            } else {
                [selSpriteRange setColor:ccc3(225, 0, 0)];
                selSpriteRange.opacity = 255;
            }
        }
    }
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    //NSLog(@"touching");
	CGPoint touchLocation = [self convertTouchToNodeSpace:touch];	
	DataModel *m = [DataModel getModel];

	if (selSprite) {
		CGRect backgroundRect = CGRectMake(background.position.x, 
									   background.position.y, 
									   background.contentSize.width, 
									   background.contentSize.height);
		
		if (!CGRectContainsPoint(backgroundRect, touchLocation)) {
			CGPoint touchLocationInGameLayer = [m._gameLayer convertTouchToNodeSpace:touch];
            //float x=touchLocationInGameLayer.x * 2;
            //float y=touchLocationInGameLayer.y * 2;
            //CGPoint touc=ccp(x, y);
			[m._gameLayer addTower:touchLocationInGameLayer :selSprite.tag];
            BOOL isBuildable = [m._gameLayer canBuildOnTilePosition: touchLocationInGameLayer];
            if (isBuildable) {
                [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
            }else{
                [[SimpleAudioEngine sharedEngine]playEffect:@"unable.mp3"];
            }
            //[m._gameLayer addTower:touchLocationInGameLayer :selSprite2.tag];
		}
		//获取当前所选炮塔的类型，并将其传递给TutorialScene类中的addTower方法
        [self removeChild:selSprite cleanup:YES];
        [self removeChild:selSprite2 cleanup:YES];
		selSprite = nil;
        selSprite2 = nil;
		[self removeChild:selSpriteRange cleanup:YES];
		selSpriteRange = nil;
	}
	
	m._gestureRecognizer.enabled = YES;
}



- (void) registerWithTouchDispatcher
{
	[[[CCDirector sharedDirector]touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	[movableSprites release];
    [towerBase release];
    towerBase = nil;
    movableSprites = nil;
	[super dealloc];
}

@end
