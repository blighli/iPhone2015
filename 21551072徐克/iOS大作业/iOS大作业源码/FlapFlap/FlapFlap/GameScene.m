//
//  GameScene.m
//  FlapFlap
//
//  Created by dilemmaxk on 15/12/15.
//  Copyright © 2015年 dilemmaxk. All rights reserved.
//


#import "GameScene.h"
#import "NewGameScene.h"
#import "Player.h"
#import "Pipe.h"

static const uint32_t kPlayerCategory = 0x1 << 0;//1
static const uint32_t kPipeCategory = 0x1 << 1;//2
static const uint32_t kGroundCategory = 0x1 << 2;//4

static const CGFloat kGravity = -9.5;   //重力
BOOL isOver = NO;
/**
 The density of the body.
 @discussion
 The unit is arbitrary, as long as the relative densities are consistent throughout the application. Note that density and mass are inherently related (they are directly proportional), so changing one also changes the other. Both are provided so either can be used depending on what is more relevant to your usage.
 */
static const CGFloat kDensity = 1.15;   //

static const CGFloat kMaxVelocity = 350;    //定义最大弹跳速度

static const CGFloat kPipeSpeed = 4.5;  //管道移动一个屏幕距离的时间，参数越大，速度越慢
static const CGFloat kPipeGap = 60;     //上下管道间距的1/2
static const CGFloat kPipeFrequency = kPipeSpeed/2;

static const CGFloat kGroundHeight = 56.0;  //屏幕底部地面高度

static const NSInteger kNumLevels = 20;

static const CGFloat randomFloat(CGFloat Min, CGFloat Max){
  return floor(((rand() % RAND_MAX) / (RAND_MAX * 1.0)) * (Max - Min) + Min);
}

@implementation GameScene
{
  Player *_player;
  SKSpriteNode *_ground;
  SKLabelNode *_scoreLabel;
  NSInteger _score;
  NSTimer *_pipeTimer;
  NSTimer *_scoreTimer;
  SKAction *_pipeSound;
  SKAction *_punchSound;
}

- (id)initWithSize:(CGSize)size
{
  if (self = [super initWithSize:size]) {
    _score = 0;

    srand((time(nil) % kNumLevels)*10000);

    [self setBackgroundColor:[SKColor colorWithRed:.69 green:.84 blue:.97 alpha:1]];

    //设置物理环境重力属性
    [self.physicsWorld setGravity:CGVectorMake(0, kGravity)];
    //指定SKPhysicsContactDelegate协议
    [self.physicsWorld setContactDelegate:self];
    //设置云朵精灵
    [self setupCloud];
    //设置地面精灵
    [self setupGroup];
    //设置分数精灵
    [self setupScore];
    //设置小鸟精灵
    [self setupPlayer];

    //创建一个定时器，并加入到当前运行循环中,经过kPipeFrequency时间之后，就增加一个障碍
    _pipeTimer = [NSTimer scheduledTimerWithTimeInterval:kPipeFrequency target:self selector:@selector(addObstacle) userInfo:nil repeats:YES];

    [NSTimer scheduledTimerWithTimeInterval:kPipeFrequency target:self selector:@selector(startScoreTimer) userInfo:nil repeats:NO];
      
    _pipeSound = [SKAction playSoundFileNamed:@"pipe.mp3" waitForCompletion:NO];
    _punchSound = [SKAction playSoundFileNamed:@"punch3.mp3" waitForCompletion:NO];
  }
  return self;
}

#pragma mark - 创建云朵精灵
- (void)setupCloud
{
    //使用图片创建左边的云精灵
    SKSpriteNode *cloud1 = [SKSpriteNode spriteNodeWithImageNamed:@"Cloud"];
    [cloud1 setPosition:CGPointMake(100, self.size.height - (cloud1.size.height*3))];
    [self addChild:cloud1];
    
    //使用图片创建右边的云精灵
    SKSpriteNode *cloud2 = [SKSpriteNode spriteNodeWithImageNamed:@"Cloud"];
    [cloud2 setPosition:CGPointMake(self.size.width - (cloud2.size.width/2) + 50, self.size.height - (cloud2.size.height*5))];
    [self addChild:cloud2];
}

#pragma mark - 创建地面精灵
- (void)setupGroup
{
    //使用图片创建一个地面精灵
    _ground = [SKSpriteNode spriteNodeWithImageNamed:@"Ground"];
    
    /**
     Controls how the texture is stretched to fill the SKSpriteNode. Stretching is performed via a 9-part algorithm where the upper & lower middle parts are scaled horizontally, the left and right middle parts are scaled vertically, the center is scaled in both directions, and the corners are preserved. The centerRect defines the center region in a (0.0 - 1.0) coordinate space. Defaults to {(0,0) (1,1)} (the entire texture is stretched).
     */
    [_ground setCenterRect:CGRectMake(26.0/kGroundHeight, 26.0/kGroundHeight, 4.0/kGroundHeight, 4.0/kGroundHeight)];
    [_ground setPosition:CGPointMake(self.size.width/2, _ground.size.height/2)];
    [self addChild:_ground];
    
    _ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_ground.size];
    /**
     Physics body attached to the node, with synchronized scale, rotation, and position
     */
    /**
     Defines what logical 'categories' this body belongs to. Defaults to all bits set (all categories).
     分类掩码：定义了物体属于哪个分类
     */
    [_ground.physicsBody setCategoryBitMask:kGroundCategory];
    /**
     Defines what logical 'categories' of bodies this body responds to collisions with. Defaults to all bits set (all categories).
     碰撞掩码：定义了哪些物理刚体分类可以和这个物理刚体发生碰撞
     */
    [_ground.physicsBody setCollisionBitMask:kPlayerCategory];
    //设置精灵是否收到重力影响
    [_ground.physicsBody setAffectedByGravity:NO];
    //设置刚体为静态刚体
    [_ground.physicsBody setDynamic:NO];
    
    [_ground setXScale:self.size.width/kGroundHeight];
}

#pragma mark - 设置分数
- (void)setupScore
{
    _scoreLabel = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    [_scoreLabel setPosition:CGPointMake(self.size.width/2, self.size.height-50)];
    //更新分数
    [_scoreLabel setText:[NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:_score]]];
    [self addChild:_scoreLabel];
}

#pragma mark - 创建角色精灵
- (void)setupPlayer
{
  _player = [Player spriteNodeWithImageNamed:@"Bird"];
  [_player setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
  [self addChild:_player];

  _player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_player.size];
  [_player.physicsBody setDensity:kDensity];
  [_player.physicsBody setAllowsRotation:NO];

    /**
     判断其他物体是否可以跟自己发生碰撞，要根据自己的collisionBitMask的值与对方物体的categoryBitMask的值进行逻辑与运算，得到的结果不为0，即可以发生碰撞
     判断碰撞的两个物体是否发生影响时，假设为A和B，首先是A的categoryBitMask与B的contactTestBitMask进行逻辑与运算，B也做同样的运算，当两者的结果都不为0时，两者即可在碰撞的时候互相影响
     */
    /**定义_player的分类掩码
     */
  [_player.physicsBody setCategoryBitMask:kPlayerCategory];
    /**定义_player的接触测试掩码为 
     kPipeCategory和kGroundCategory 逻辑或之后的值 0110
     */
  [_player.physicsBody setContactTestBitMask:kPipeCategory | kGroundCategory];
    /**
     碰撞检测掩码： 使用kGroundCategory和kPipeCategory逻辑或得到的值 0110
     */
  [_player.physicsBody setCollisionBitMask:kGroundCategory | kPipeCategory];
}

#pragma mark - 增加障碍物
- (void)addObstacle
{
    //centerY是上下管道间距的中心点坐标
  CGFloat centerY = randomFloat(kPipeGap, self.size.height-kPipeGap);
  CGFloat pipeTopHeight = centerY - kPipeGap;
  CGFloat pipeBottomHeight = self.size.height - (centerY + kPipeGap);

  // 设置顶部管道
  Pipe *pipeTop = [Pipe pipeWithHeight:pipeTopHeight withStyle:PipeStyleTop];
  [pipeTop setPipeCategory:kPipeCategory playerCategory:kPlayerCategory];
  [self addChild:pipeTop];

  // 设置底部管道
  Pipe *pipeBottom = [Pipe pipeWithHeight:pipeBottomHeight withStyle:PipeStyleBottom];
  [pipeBottom setPipeCategory:kPipeCategory playerCategory:kPlayerCategory];
  [self addChild:pipeBottom];

  // 移动顶部管道
  SKAction *pipeTopAction = [SKAction moveToX:-(pipeTop.size.width/2) duration:kPipeSpeed];
//  SKAction *pipeTopSequence = [SKAction sequence:@[pipeTopAction, [SKAction runBlock:^{
//    [pipeTop removeFromParent];
//  }]]];
//  [pipeTop runAction:[SKAction repeatActionForever:pipeTopSequence]];
    [pipeTop runAction:[SKAction repeatActionForever:pipeTopAction]];
  // 移动底部管道
  SKAction *pipeBottomAction = [SKAction moveToX:-(pipeBottom.size.width/2) duration:kPipeSpeed];
  SKAction *pipeBottomSequence = [SKAction sequence:@[pipeBottomAction, [SKAction runBlock:^{
    [pipeBottom removeFromParent];
  }]]];
    
  [pipeBottom runAction:[SKAction repeatActionForever:pipeBottomSequence]];
}

#pragma mark - 开始计分
/**定义一个计时器，时间间隔为kPipeFrequency */
- (void)startScoreTimer
{
  _scoreTimer = [NSTimer scheduledTimerWithTimeInterval:kPipeFrequency target:self selector:@selector(incrementScore) userInfo:nil repeats:YES];
}

#pragma mark - 分数增加
- (void)incrementScore
{
  _score++;
  [_scoreLabel setText:[NSString stringWithFormat:@"%@", [NSNumber numberWithInteger:_score]]];
  [self runAction:_pipeSound];
}

//点击屏幕控制小鸟移动和游戏重新开始
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (isOver)
    {
        SKTransition *transition = [SKTransition doorsCloseHorizontalWithDuration:.4];
        NewGameScene *newGame = [[NewGameScene alloc] initWithSize:self.size];
        [self.scene.view presentScene:newGame transition:transition];
        isOver = NO;
    }
  [_player.physicsBody setVelocity:CGVectorMake(_player.physicsBody.velocity.dx, kMaxVelocity)];
}

//更新每一帧的内容
- (void)update:(NSTimeInterval)currentTime
{
  if (_player.physicsBody.velocity.dy > kMaxVelocity) {
    [_player.physicsBody setVelocity:CGVectorMake(_player.physicsBody.velocity.dx, kMaxVelocity)];
  }

  CGFloat rotation = ((_player.physicsBody.velocity.dy + kMaxVelocity) / (2*kMaxVelocity)) * M_2_PI;
  [_player setZRotation:rotation-M_1_PI/2];
}

//发生碰撞
- (void)didBeginContact:(SKPhysicsContact *)contact
{
  SKNode *node = contact.bodyA.node;
  if ([node isKindOfClass:[Player class]]) {
    [_pipeTimer invalidate];
    [_scoreTimer invalidate];
    [self runAction:_punchSound completion:^{
        //移除分数
        [_scoreLabel removeFromParent];
        
        //添加游戏提示
        SKLabelNode *_gameOver = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
        _gameOver.fontColor = [UIColor blackColor];
        [_gameOver setPosition:CGPointMake(self.size.width/2, self.size.height/2+50)];
        [_gameOver setText:[NSString stringWithFormat:@"Game Over"]];
        [self addChild:_gameOver];
        
        isOver = YES;
        
        SKLabelNode *_restart = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
        _restart.fontSize = 16;
        _restart.fontColor = [UIColor blackColor];
        [_restart setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        [_restart setText:[NSString stringWithFormat:@"Click To ReStart"]];
        [self addChild:_restart];
    }];
  }
}

@end
