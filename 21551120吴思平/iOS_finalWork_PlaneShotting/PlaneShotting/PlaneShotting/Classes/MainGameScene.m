//
//  MainGameScene.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "MainGameScene.h"
#import "Plane.h"
#import "Enemy.h"
#import "Bullet.h"
#import "GameManager.h"
#import "GameOverScene.h"

@implementation MainGameScene

- (id)initWithPlane:(int)index
{
    self = [super init];
    NSAssert(self, @"Whoops");
    self.userInteractionEnabled = YES;
    
    win_size = [CCDirector sharedDirector].viewSize;
    
    [self initLabel];
    
    // Background1
    CGSize imageSize={480,860};
    background1 = [CCSprite spriteWithImageNamed:@"MainGameScene_bg.png"];
    background1.anchorPoint=ccp(0, 0);
    background1.scaleX=win_size.width/imageSize.width;
    background1.scaleY=win_size.height/imageSize.height;
    CCLOG(@"%f,%f",background1.position.x,background1.position.y);
    [self addChild:background1];
    
    // Background2
    background2 = [CCSprite spriteWithImageNamed:@"MainGameScene_bg.png"];
    background2.anchorPoint=ccp(0, 0);
    background2.scaleX=win_size.width/imageSize.width;
    background2.scaleY=win_size.height/imageSize.height;
    background2.position = ccp(0, win_size.height);
    [self addChild:background2];
    
    //返回按钮
    CCSpriteFrame *backImg = [CCSpriteFrame frameWithImageNamed:@"back.png"];
    CCButton* backBtn = [CCButton buttonWithTitle:@"" spriteFrame:backImg];
    backBtn.anchorPoint = ccp(1,1);
    backBtn.scale = 0.25;
    backBtn.position = ccp(win_size.width-20, win_size.height-20);
    [backBtn setTarget:self selector:@selector(backToStartScene)];
    
    [self addChild:backBtn];
    
    hero = [[Plane alloc]initPlaneWithIndex:index];
    [hpLabel setString:[NSString stringWithFormat:@"HP：%i",hero.hp]];
    [hero setZOrder:100];
    [self addChild:hero];
    
    manager = [GameManager sharedInstanceMethod];
    [manager addPlane:hero];
    
    //背景音乐
    [manager.audio playBg:@"bgMusic.mp3" loop:true];
    
    [self schedule:@selector(addEnemy) interval:2];
    //默认生成的子弹类型为1
    bulletType = 1;
    [self schedule:@selector(addBullet) interval:0.5];
    
    return self;
}

-(void) backToStartScene
{
    //停止播放音乐
    [manager.audio stopBg];
    [[CCDirector sharedDirector]popSceneWithTransition:[CCTransition transitionCrossFadeWithDuration:1]];
}

- (void) initLabel
{
    int highScore = 0;
    //历史最高分
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",documentsDirectory,@"HighScore.plist"];
    
    NSMutableDictionary* plistDict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    NSMutableArray *highScoreArray = [plistDict objectForKey:@"HighScore"];
    
    if (plistDict != nil && highScoreArray != nil)
    {
        highScore = (int)[[highScoreArray objectAtIndex:0]integerValue];
    }

    CCLabelTTF *highScoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"历史最高分：%i",highScore] fontName:@"ArialMT" fontSize:15];
    [highScoreLabel setAnchorPoint:(CGPoint){0,1}];
    [highScoreLabel setPosition:ccp(25, win_size.height-25)];
    [highScoreLabel setZOrder:100];
    [highScoreLabel setColor:[CCColor whiteColor]];
    [self addChild:highScoreLabel];
    
    //分数
    scoreLabel = [CCLabelTTF labelWithString:@"分数：0" fontName:@"ArialMT" fontSize:15];
    [scoreLabel setAnchorPoint:(CGPoint){0,1}];
    [scoreLabel setPosition:ccp(25, win_size.height-50)];
    [scoreLabel setZOrder:100];
    [scoreLabel setColor:[CCColor whiteColor]];
    [self addChild:scoreLabel];
    
    //当前血量
    hpLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"HP：%i",hero.hp] fontName:@"ArialMT" fontSize:15];
    [hpLabel setAnchorPoint:(CGPoint){0,1}];
    [hpLabel setPosition:ccp(25, win_size.height-75)];
    [hpLabel setZOrder:100];
    [hpLabel setColor:[CCColor whiteColor]];
    [self addChild:hpLabel];
}

- (void) update:(CCTime)delta
{
    //背景的移动
    [background1 setPosition:ccp(0, background1.position.y - 5)];
    [background2 setPosition:ccp(0, background2.position.y - 5)];
    
    if (background1.position.y <= -win_size.height )
    {
        [background1 setPosition:ccp(0, win_size.height)];
    }
    if (background2.position.y <= -win_size.height)
    {
        [background2 setPosition:ccp(0, win_size.height)];
    }
    
    //碰撞检测
    [self collideTest];
    
}

//添加敌机
- (void) addEnemy
{
    int enemyType = 0;
    if (CCRANDOM_0_1()*10 >=5) {
        enemyType = 1;
    } else {
        enemyType = 2;
    }
    Enemy *enemy = [[Enemy alloc]initEnemyWithIndex:enemyType];
    
    CGSize enemy_size = [enemy contentSize];
    //随机生成敌机的x位置
    int enemy_x = CCRANDOM_0_1()*(win_size.width-enemy_size.width/2)+enemy_size.width/4;
    [enemy setPosition:CGPointMake(enemy_x, win_size.height)];
    
    id enemy_move = [CCActionMoveTo actionWithDuration:5.0f position:CGPointMake(enemy_x, -enemy_size.height/4)];
    
    Enemy*  __enemy = enemy;
    //ememy移出屏幕的时候移除
    id enemy_move_end = [CCActionCallBlock actionWithBlock:^{
        [__enemy removeFromParentAndCleanup:YES];
        [manager removeEnemy:__enemy];
    }];
    [enemy runAction:[CCActionSequence actions:enemy_move,enemy_move_end,nil]];
    [self addChild:enemy];
    [manager addEnemy:enemy];
}

//添加子弹
- (void) addBullet
{
    Bullet *bullet = [[Bullet alloc] initBulletWithIndex:bulletType];
    
    [bullet setPosition:CGPointMake(hero.position.x, hero.position.y)];
    
    CGSize bullet_size = [bullet contentSize];
    
    id bullet_move = [CCActionMoveTo actionWithDuration:5.0f position:CGPointMake(bullet.position.x,win_size.height+bullet_size.height/4)];
    
    Bullet* __bullet = bullet;
    id bullet_move_end = [CCActionCallBlock actionWithBlock:^{
        [__bullet removeFromParentAndCleanup:YES];
        [manager removeBullet:__bullet];
    }];
    [bullet runAction:[CCActionSequence actions:bullet_move,bullet_move_end,nil]];
    [self addChild:bullet];
    [manager addBullet:bullet];
}

//碰撞检测
- (void) collideTest
{
    Enemy* enemy = [manager collidePlaneWithEnemy];
    //飞机与敌机相撞
    if ( enemy != nil)
    {
        //飞机的还有血，则敌机死亡，飞机血减少
        hero.hp = hero.hp - enemy.damage;
        if (hero.hp <= 0)
        {
            [self planeDead];
        }
        else
        {
            [manager.audio playEffect:@"heroBreak.wav"];
            //更新显示的血量
            [hpLabel setString:[NSString stringWithFormat:@"HP：%i",hero.hp]];
            [manager.enemy_remove_array addObject:enemy];
            enemy.isDead = YES;
            manager.score = manager.score + enemy.score;
            //敌人消失并播放死亡动画
            CCAnimation *enemy_dead_animation = [Enemy deadAnimationOfEnemy];
            CCActionAnimate *enemy_dead_actionAnimate = [CCActionAnimate actionWithAnimation:enemy_dead_animation];
            //移除所有命中的子弹和敌人
            id remove_enemy = [CCActionCallFunc actionWithTarget:self selector:@selector(removeActionWithEnemy)];
            id enemy_dead_action = [CCActionSequence actions:enemy_dead_actionAnimate,remove_enemy,nil];
            
            [enemy runAction:enemy_dead_action];
        }
    }
    else
    {
        //飞机未被击毁.检测子弹和敌机的碰撞
        BOOL isCrash = [manager collideEnemyWithBullet];
        if (isCrash == YES) {
            [scoreLabel setString:[NSString stringWithFormat:@"分数：%i",manager.score]];
        }
    }

}

//飞机与敌机相撞，敌机炸毁，飞机掉血
- (void) removeActionWithEnemy
{
    for (int i =0; i < [manager.enemy_remove_array count]; i++)
    {
        Enemy *enemy = [manager.enemy_remove_array objectAtIndex:i];
        [manager.enemy_remove_array removeObject:enemy];
        
        //判断enemy是否已经移出屏幕
        if ([manager.enemy_array containsObject:enemy])
        {
            [manager.enemy_array removeObject:enemy];
        }
        
        [enemy removeFromParentAndCleanup:YES];
    }
}

//飞机被炸毁
- (void) planeDead
{
    [hero removeFromParentAndCleanup:YES];
    [manager.audio playEffect:@"heroDead.mp3"];
    
    //停止更新
    [self unschedule:@selector(addEnemy)];
    [self unschedule:@selector(addBullet)];
    
    //保存成绩
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",documentsDirectory,@"HighScore.plist"];
    
    NSMutableDictionary* plistDict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    if (plistDict == nil)
        plistDict = [[NSMutableDictionary alloc] init];

    NSMutableArray *highScoreArray = [[plistDict objectForKey:@"HighScore"] mutableCopy];
    
    NSArray *resultArray;
    if (highScoreArray == nil)
    {
        //存储最高的5个分数
        highScoreArray = [[NSMutableArray alloc]initWithCapacity:5];
        [highScoreArray addObject:[NSNumber numberWithInt:manager.score]];
        resultArray = [highScoreArray copy];
    }
    else
    {
        [highScoreArray addObject:[NSNumber numberWithInt:manager.score]];
        resultArray = [highScoreArray sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2)
        {
            if ([obj1 compare:obj2] == NSOrderedAscending)
            {
                return NSOrderedDescending;
            }
            else
            {
                return NSOrderedAscending;
            }
        }];
        if ([resultArray count]>=5)
        {
            NSRange range = NSMakeRange(0, 5);
            resultArray = [resultArray subarrayWithRange:range];
        }
        
    }
    [plistDict setObject:resultArray forKey:@"HighScore"];
    [plistDict writeToFile:filePath atomically:YES];
    
    //停止播放音乐
    [manager.audio stopBg];
    
    //切换场景
    CCScene* gameOverScene = [[GameOverScene alloc]initWithScore:manager.score];
    [[CCDirector sharedDirector]replaceScene:gameOverScene withTransition:[CCTransition transitionFadeWithDuration:3]];
}

//监听首次触发事件
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint touchPoint_ios = [touch locationInView:[touch view]];//iOS坐标
    CGPoint touchPoint = CGPointMake(touchPoint_ios.x,win_size.height-touchPoint_ios.y);//openGL坐标
    
    CGRect plane_rec = [hero boundingBox];//openGL坐标
    CGSize plane_size = [hero contentSize];
    
    if ( CGRectContainsPoint(plane_rec,touchPoint) )
    {
        //手指可以控制飞机(hero缩小为一半)
        if (touchPoint.x > (win_size.width-[hero contentSize].width/4))
        { //超出右边界
            touchPoint.x = (win_size.width-[hero contentSize].width/4);
        }
        else if (touchPoint.x < plane_size.width/4)
        { //超出左边界
            touchPoint.x = plane_size.width/4;
        }
        if (touchPoint.y > (win_size.height - plane_size.height/4))
        { //超出上边界
            touchPoint.y = win_size.height - plane_size.height/4;
        }
        else if (touchPoint.y < plane_size.height/4)
        { //超出下边界
            touchPoint.y = plane_size.height/4;
        }
        [hero setPosition:touchPoint];
    }
    
    return;
}

//触摸事件 - 当手指在屏幕上进行移动
- (void)touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint touchPoint_ios = [touch locationInView:[touch view]];//iOS坐标
    CGPoint touchPoint = CGPointMake(touchPoint_ios.x,win_size.height-touchPoint_ios.y);//openGL坐标
    
    CGRect plane_rec = [hero boundingBox];//openGL坐标
    CGSize plane_size = [hero contentSize];
    
    if ( CGRectContainsPoint(plane_rec,touchPoint) )
    {
        //手指可以控制飞机
        if (touchPoint.x > (win_size.width-[hero contentSize].width/4))
        { //超出右边界
            touchPoint.x = (win_size.width-[hero contentSize].width/4);
        }
        else if (touchPoint.x < plane_size.width/4)
        { //超出左边界
            touchPoint.x = plane_size.width/4;
        }
        if (touchPoint.y > (win_size.height - plane_size.height/4))
        { //超出上边界
            touchPoint.y = win_size.height - plane_size.height/4;
        }
        else if (touchPoint.y < plane_size.height/4)
        { //超出下边界
            touchPoint.y = plane_size.height/4;
        }
        [hero setPosition:touchPoint];
    }
    
    return;
}

//触摸事件 - 当手指从屏幕抬起时调用的方法
-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    return;
}


@end
