//
//  cardMatchingGame.h
//  MachismoBeta
//
//  Created by wanghaobo on 15/10/1.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface cardMatchingGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
@property (nonatomic,readonly) NSInteger score;
- (void)chooseCardAtIndex:(NSUInteger) index;
- (Card *)cardAtIndex:(NSUInteger) index;
// public API
@end
