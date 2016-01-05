//
//  playingCardGame.h
//  cardGame
//
//  Created by zhouxw on 12/12/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface playingCardGame : NSObject

@property(nonatomic,readonly) NSUInteger score;
@property(nonatomic,copy) NSString *describeInfo;
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;
-(Card *)cardAtIndex:(NSUInteger)index;
-(void)chooseCardAtIndex:(NSUInteger)index withOn:(BOOL)on;
-(void)clearScore;

@end
