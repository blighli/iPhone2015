//
//  ViewController.m
//  FlapFlap
//
//  Created by dilemmaxk on 15/12/15.
//  Copyright © 2015年 dilemmaxk. All rights reserved.
//

#import "ViewController.h"
#import "NewGameScene.h"

@implementation ViewController

- (void)loadView
{
  self.view  = [[SKView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

  SKView *view = (SKView *)[self view];
    //显示游戏刷新的次数
  [view setShowsFPS:YES];
    //显示当前节点的个数
  [view setShowsNodeCount:YES];

  SKScene *scene = [NewGameScene sceneWithSize:view.bounds.size];
    /**
     Used to determine how to scale the scene to match the SKView it is being displayed in.
     */
  [scene setScaleMode:SKSceneScaleModeAspectFill];

    /**
     Present an SKScene in the view, replacing the current scene.
     
     @param scene the scene to present.
     */
  [view presentScene:scene];
}

@end
