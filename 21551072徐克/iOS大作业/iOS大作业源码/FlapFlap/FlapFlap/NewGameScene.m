//
//  NewGameScene.m
//  FlapFlap
//
//  Created by dilemmaxk on 15/12/15.
//  Copyright © 2015年 dilemmaxk. All rights reserved.
//


#import "NewGameScene.h"
#import "GameScene.h"

@implementation NewGameScene
{
  SKSpriteNode *_button;
    SKLabelNode *_title;
}

- (id)initWithSize:(CGSize)size
{
  if (self = [super initWithSize:size]) {
    [self setBackgroundColor:[SKColor colorWithRed:.61 green:.74 blue:.86 alpha:1]];

      /**
       Create a sprite with a color and the specified bounds.
       @param color the color to use for tinting the sprite.
       @param size the size of the sprite in points
       */
      //设置游戏开始界面精灵节点的属性
    _button = [SKSpriteNode spriteNodeWithColor:[SKColor colorWithWhite:1 alpha:1] size:CGSizeMake(128, 32)];
      _button = [SKSpriteNode spriteNodeWithImageNamed:@"FlappyBird"];
    [_button setPosition:CGPointMake(self.size.width/2, self.size.height/2+50)];
    [self addChild:_button];
  }
  return self;
}

//定义屏幕的切换效果
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //设置屏幕关屏效果
  SKTransition *transition = [SKTransition doorsCloseHorizontalWithDuration:.4];
    //要转换的场景，转入游戏场景
  GameScene *game = [[GameScene alloc] initWithSize:self.size];
    /**
     Present an SKScene in the view, replacing the current scene.
     
     If there is currently a scene being presented in the view, the transition is used to swap between them.
     
     @param scene the scene to present.
     @param transition the transition to use when presenting the scene.
     */
  [self.scene.view presentScene:game transition:transition];
}

@end
