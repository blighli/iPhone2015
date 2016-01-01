//
//  HelloWorldLayer.m
//  PlayThePlane
//
//  Created by zhongweiwei on 15/12/11.
//  Copyright cspilgrimzww 2016年 . All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        [self initData];
        [self loadBackground];
        [self loadPlayer];
        [self madeBullet];
        [self resetBullet];
        
        [self scheduleUpdate];
        
        // touch事件代理
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
        
	}
	return self;
}

- (void) update:(ccTime)delta {
    if (!isGameOver) {
        [self backgrouneScroll];
        [self firingBullets];
        [self addFoePlane];
        [self moveFoePlane];
        [self collisionDetection];
        [self makeProps];
        [self bulletTiming];
    }
}
 
- (void) initData {
    adjustmentBG = 568;
    bulletSum = 0;
    isBigBullet = NO;
    isChangeBullet = NO;
    bulletTiming = 900;
    bulletSpeed = 25;
    bigPlan = 0;
    smallPlan = 0;
    mediumPlan = 0;
    props = 0;
    score = 0;
    isVisible = NO;
    isGameOver = NO;
    foePlanes = [CCArray array];
    [foePlanes retain];
}

/* ----资源加载-------
- (void) loadResources {
    [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"gameArts.plist"];
}
 */

// 载入背景
- (void) loadBackground {
    BG1 = [CCSprite spriteWithSpriteFrameName:@"background_2.png"];
    [BG1 setAnchorPoint:ccp(0.5, 0)];
    [BG1 setPosition:ccp(160, adjustmentBG)];
    [self addChild:BG1 z:0];
    
    BG2 = [CCSprite spriteWithSpriteFrameName:@"background_2.png"];
    [BG2 setAnchorPoint:ccp(0.5, 0)];
    [BG2 setPosition:ccp(160, 568+adjustmentBG)];
    [self addChild:BG2 z:0];
    
    scoreLabel=[CCLabelTTF labelWithString:@"0000" fontName:@"MarkerFelt-Thin" fontSize:18];
    [scoreLabel setColor:ccc3(0, 0, 0)];
    scoreLabel.anchorPoint=ccp(0,1);
    scoreLabel.position=ccp(10,WINDOWHEIGHT-10);
    [self addChild:scoreLabel z:4];
    
}

// 背景滚动
- (void) backgrouneScroll {
    adjustmentBG--;
    
    if (adjustmentBG<=0) {
        adjustmentBG = 568;
    }
    
    [BG1 setPosition:ccp(160, adjustmentBG)];
    [BG2 setPosition:ccp(160, adjustmentBG-568)];
    
}
// 玩家飞机加载
- (void) loadPlayer {
    
    NSMutableArray *playerActionArray = [NSMutableArray array];
    for (int i = 1 ; i<=2; i++) {
        NSString* key = [NSString stringWithFormat:@"hero_fly_%d.png", i];
        //从内存池中取出Frame
        CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:key];
        //添加到序列中
        [playerActionArray addObject:frame];
    }
    
    //将数组转化为动画序列,换帧间隔0.1秒
    CCAnimation* animPlayer = [CCAnimation animationWithSpriteFrames:playerActionArray delay:0.1f];
    //生成动画播放的行为对象
    id actPlayer = [CCAnimate actionWithAnimation:animPlayer];
    //清空缓存数组
    [playerActionArray removeAllObjects];
    
    player=[CCSprite spriteWithSpriteFrameName:@"hero_fly_1.png"];
    player.position=ccp(160,50);
    [self addChild:player z:3];
    [player runAction:[CCRepeatForever actionWithAction:actPlayer]];
    
}

// 发射子弹
- (void) firingBullets {
    
    bullet.position=ccp(bullet.position.x,bullet.position.y+bulletSpeed);
    
    if (bullet.position.y>WINDOWHEIGHT-20) {
        [self resetBullet];
    }
    
}

// 子弹还原
- (void) resetBullet {
    
    if ((isBigBullet&&isChangeBullet)||(!isBigBullet&&isChangeBullet)) {
        [bullet removeFromParent];
        [self madeBullet];
        isChangeBullet = NO;
    }
    
    bulletSpeed = (460-(player.position.y + 50))/15;
    if (bulletSpeed<5)bulletSpeed=5;
    bullet.position=ccp(player.position.x,player.position.y+50);
}

// 制造子弹
- (void) madeBullet {
    
    bullet=[CCSprite spriteWithSpriteFrameName:(!isBigBullet)?@"bullet1.png":@"bullet2.png"];
    bullet.anchorPoint=ccp(0.5,0.5);
    [self addChild:bullet];

}

// --------------飞机移动-----------------------

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
    
}

- (CGPoint)boundLayerPos:(CGPoint)newPos {
    CGPoint retval = newPos;
    retval.x = player.position.x+newPos.x;
    retval.y = player.position.y+newPos.y;
    
    if (retval.x>=286) {
        retval.x = 286;
    }else if (retval.x<=33) {
        retval.x = 33;
    }
    
    if (retval.y >=WINDOWHEIGHT-50) {
        retval.y = WINDOWHEIGHT-50;
    }else if (retval.y <= 43) {
        retval.y = 43;
    }
    
    return retval;
}

- (void)panForTranslation:(CGPoint)translation {
    if (!isGameOver) {
        player.position = [self boundLayerPos:translation];
    }
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    [self panForTranslation:translation];
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

// -------------------------------------------

// 移动敌机
- (void) moveFoePlane {
    for (CCFoePlane *foePlane in foePlanes) {
        [foePlane setPosition:ccp(foePlane.position.x, foePlane.position.y-foePlane.speed)];
        if (foePlane.position.y<(-75)) {
            [foePlanes removeObject:foePlane];
            [foePlane removeFromParent];
        }
    }
}

// 添加飞机
- (void) addFoePlane {
    bigPlan++;
    smallPlan++;
    mediumPlan++;
    
    if (bigPlan>500) {
        CCFoePlane *foePlane = [self makeBigFoePlane];
        [self addChild:foePlane z:3];
        [foePlanes addObject:foePlane];
        bigPlan = 0;
    }
    
    if (mediumPlan>400) {
        CCFoePlane *foePlane = [self makeMediumFoePlane];
        [self addChild:foePlane z:3];
        [foePlanes addObject:foePlane];
        mediumPlan = 0;
    }
    
    if (smallPlan>45) {
        CCFoePlane *foePlane = [self makeSmallFoePlane];
        [self addChild:foePlane z:3];
        [foePlanes addObject:foePlane];
        smallPlan = 0;
    }
    
}

// 造大飞机
- (CCFoePlane *) makeBigFoePlane {
    
    NSMutableArray *bigFoePlaneActionArray = [NSMutableArray array];
    for (int i = 1 ; i<=2; i++) {
        NSString* key = [NSString stringWithFormat:@"enemy2_fly_%i.png", i];
        //从内存池中取出Frame
        CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:key];
        //添加到序列中
        [bigFoePlaneActionArray addObject:frame];
    }
    
    //将数组转化为动画序列,换帧间隔0.1秒
    CCAnimation* animPlayer = [CCAnimation animationWithSpriteFrames:bigFoePlaneActionArray delay:0.1f];
    //生成动画播放的行为对象
    id actPlayer = [CCAnimate actionWithAnimation:animPlayer];
    //清空缓存数组
    [bigFoePlaneActionArray removeAllObjects];
    
    CCFoePlane *bigFoePlane = [CCFoePlane spriteWithSpriteFrameName:@"enemy2_fly_1.png"];
    [bigFoePlane setPosition:ccp((arc4random()%210)+55, 732)];
    [bigFoePlane setPlaneType:2];
    [bigFoePlane setHp:30];
    [bigFoePlane runAction:[CCRepeatForever actionWithAction:actPlayer]];
    [bigFoePlane setSpeed:(arc4random()%2)+2];
    
    return bigFoePlane;
}

// 造中飞机
- (CCFoePlane *) makeMediumFoePlane {
    CCFoePlane *mediumFoePlane = [CCFoePlane spriteWithSpriteFrameName:@"enemy3_fly_1.png"];
    [mediumFoePlane setPosition:ccp((arc4random()%268)+23, 732)];
    [mediumFoePlane setPlaneType:3];
    [mediumFoePlane setHp:15];
    [mediumFoePlane setSpeed:(arc4random()%3)+2];
    return mediumFoePlane;
}

// 造小飞机
- (CCFoePlane *) makeSmallFoePlane {
    CCFoePlane *smallFoePlane = [CCFoePlane spriteWithSpriteFrameName:@"enemy1_fly_1.png"];
    [smallFoePlane setPosition:ccp((arc4random()%240)+17, 732)];
    [smallFoePlane setPlaneType:1];
    [smallFoePlane setHp:1];
    [smallFoePlane setSpeed:(arc4random()%4)+2];
    return smallFoePlane;
}

// 制作道具
- (void) makeProps {
    props++;
    if (props>1520) {
        prop = [CCProps node];
        [prop initWithType:(arc4random()%2)+4];
        [self addChild:prop.prop];
        [prop propAnimation];
        [prop retain];
        props = 0;
        isVisible = YES;
    }
    
}

// 子弹持续时间
- (void) bulletTiming {
    if (isBigBullet) {
        if (bulletTiming>0) {
            bulletTiming--;
        }else {
            isBigBullet = NO;
            isChangeBullet = YES;
            bulletTiming = 900;
        }
    }
}

// 碰撞检测
- (void) collisionDetection {
    
    // 子弹跟敌机
    CGRect bulletRec = bullet.boundingBox;
    for (CCFoePlane *foePlane in foePlanes) {
        if (CGRectIntersectsRect(bulletRec, foePlane.boundingBox)) {
            
            [self resetBullet];
            [self fowPlaneHitAnimation:foePlane];
            foePlane.hp = foePlane.hp-(isBigBullet?2:1);
            if (foePlane.hp<=0) {
                [self fowPlaneBlowupAnimation:foePlane];
                [foePlanes removeObject:foePlane];
            }
            
        }
    }
    
    // 飞机跟打飞机
    CGRect playerRec = player.boundingBox;
    playerRec.origin.x += 25;
    playerRec.size.width -= 50;
    playerRec.origin.y -= 10;
    playerRec.size.height -= 10;
    for (CCFoePlane *foePlane in foePlanes) {
        if (CGRectIntersectsRect(playerRec, foePlane.boundingBox)) {
            [self gameOver];
            [self playerBlowupAnimation];
            [self fowPlaneBlowupAnimation:foePlane];
            [foePlanes removeObject:foePlane];
        }
    }
    
    // 飞机跟道具
    
    if (isVisible) {
        CGRect playerRec1 = player.boundingBox;
        CGRect propRec = prop.prop.boundingBox;
        if (CGRectIntersectsRect(playerRec1, propRec)) {
            
            [prop.prop stopAllActions];
            [prop.prop removeFromParent];
            isVisible = NO;
            
            if (prop.type == propsTypeBullet) {
                isBigBullet = YES;
                isChangeBullet = YES;
            }else if (prop.type == propsTypeBomb) {
                for (CCFoePlane *foePlane in foePlanes) {
                    [self fowPlaneBlowupAnimation:foePlane];
                }
                [foePlanes removeAllObjects];
            }
        }
    }

    
}

// 添加打击效果
- (void) fowPlaneHitAnimation:(CCFoePlane *)foePlane {
    if (foePlane.planeType == 3) {
        if (foePlane.hp==13) {
            NSMutableArray *playerActionArray = [NSMutableArray array];
            for (int i = 1 ; i<=2; i++) {
                NSString* key = [NSString stringWithFormat:@"enemy3_hit_%d.png",i];
                //从内存池中取出Frame
                CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:key];
                //添加到序列中
                [playerActionArray addObject:frame];
            }
            
            //将数组转化为动画序列,换帧间隔0.1秒
            CCAnimation* animPlayer = [CCAnimation animationWithSpriteFrames:playerActionArray delay:0.1f];
            //生成动画播放的行为对象
            id actPlayer = [CCAnimate actionWithAnimation:animPlayer];
            //清空缓存数组
            [playerActionArray removeAllObjects];
            [foePlane stopAllActions];
            [foePlane runAction:[CCRepeatForever actionWithAction:actPlayer]];
        }
    }else if (foePlane.planeType == 2) {
        if (foePlane.hp==20) {
            NSMutableArray *playerActionArray = [NSMutableArray array];
            for (int i = 1 ; i<=1; i++) {
                NSString* key = [NSString stringWithFormat:@"enemy2_hit_%d.png",i];
                //从内存池中取出Frame
                CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:key];
                //添加到序列中
                [playerActionArray addObject:frame];
            }
            
            //将数组转化为动画序列,换帧间隔0.1秒
            CCAnimation* animPlayer = [CCAnimation animationWithSpriteFrames:playerActionArray delay:0.1f];
            //生成动画播放的行为对象
            id actPlayer = [CCAnimate actionWithAnimation:animPlayer];
            //清空缓存数组
            [playerActionArray removeAllObjects];
            [foePlane stopAllActions];
            [foePlane runAction:[CCRepeatForever actionWithAction:actPlayer]];
        }
    }
}

// 爆炸动画
- (void) fowPlaneBlowupAnimation:(CCFoePlane *)foePlane {
    int forSum;
    if (foePlane.planeType == 3) {
        forSum = 4;
        score+=6000;
    }else if (foePlane.planeType  == 2) {
        score+=30000;
        forSum = 7;
    }else if (foePlane.planeType  == 1) {
        forSum = 4;
        score+=1000;
    }
    
    [scoreLabel setString:[NSString stringWithFormat:@"%d",score]];
    
    [foePlane stopAllActions];
    NSMutableArray *foePlaneActionArray = [NSMutableArray array];
    
    for (int i = 1; i<=forSum ; i++ ) {
        NSString* key = [NSString stringWithFormat:@"enemy%d_blowup_%i.png",foePlane.planeType , i];
        //从内存池中取出Frame
        CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:key];
        //添加到序列中
        [foePlaneActionArray addObject:frame];
    }
    
    //将数组转化为动画序列,换帧间隔0.1秒
    CCAnimation* animPlayer = [CCAnimation animationWithSpriteFrames:foePlaneActionArray delay:0.1f];
    //生成动画播放的行为对象
    id actFowPlane = [CCAnimate actionWithAnimation:animPlayer];
    id end = [CCCallFuncN actionWithTarget:self selector:@selector(blowupEnd:)];
    //清空缓存数组
    [foePlaneActionArray removeAllObjects];
    
    [foePlane runAction:[CCSequence actions:actFowPlane, end, nil]];
}

// 飞机爆炸
- (void) playerBlowupAnimation {
    NSMutableArray *foePlaneActionArray = [NSMutableArray array];
    
    for (int i = 1; i<=4 ; i++ ) {
        NSString* key = [NSString stringWithFormat:@"hero_blowup_%i.png", i];
        //从内存池中取出Frame
        CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:key];
        //添加到序列中
        [foePlaneActionArray addObject:frame];
    }
    
    //将数组转化为动画序列,换帧间隔0.1秒
    CCAnimation* animPlayer = [CCAnimation animationWithSpriteFrames:foePlaneActionArray delay:0.1f];
    //生成动画播放的行为对象
    id actFowPlane = [CCAnimate actionWithAnimation:animPlayer];
    //清空缓存数组
    [foePlaneActionArray removeAllObjects];
    
    [player runAction:[CCSequence actions:actFowPlane, nil]];
}

- (void) playerBlowupEnd:(id)sender {
    
}

- (void) blowupEnd : (id) sender {
    
    CCFoePlane *foePlane = (CCFoePlane *) sender;
    [foePlane removeFromParent];
}

- (void) gameOver {
    
    isGameOver = YES;
    CCNode *node;
    CCARRAY_FOREACH([self children], node){
        [node stopAllActions];
    }
    
    gameOverLabel = [CCLabelTTF labelWithString:@"GameOver" fontName:@"MarkerFelt-Thin" fontSize:35];
    [gameOverLabel setPosition:ccp(160, 300)];
    [self addChild:gameOverLabel z:4];
    
    CCMenuItemFont *gameOverItem = [CCMenuItemFont itemWithString:@"restart" target:self selector:@selector(restart)];
    [gameOverItem setFontName:@"MarkerFelt-Thin"];
    [gameOverItem setFontSize:30];
    restart = [CCMenu menuWithItems:gameOverItem, nil];
    [restart setPosition:ccp(160, 200)];
    [self addChild:restart z:4];
}

- (void) restart {
    [self removeAllChildren];
    [foePlanes removeAllObjects];
    [self initData];
    [self loadBackground];
    [self loadPlayer];
    [self madeBullet];
    [self resetBullet];
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
