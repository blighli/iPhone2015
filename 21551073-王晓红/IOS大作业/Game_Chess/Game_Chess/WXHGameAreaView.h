//
//  WXHGameAreaView.h
//  Game_Chess
//
//  Created by apple on 16/1/3.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXHParent.h"
@interface WXHGameAreaView : UIView

@property (nonatomic,assign) GAMESTATE gameState;

- (void)onInitNodesWithPlayer:(WXHParent*)player;
- (void)onCalculateNodeNum;
- (void)onJudgeWinForPlayer:(WXHParent*)player OtherPlayer:(WXHParent*)OtherPlayer;
@end
