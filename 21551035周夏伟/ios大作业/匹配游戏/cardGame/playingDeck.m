//
//  playingDeck.m
//  cardGame
//
//  Created by zhouxw on 12/10/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "playingDeck.h"
#import "playingCard.h"
@implementation playingDeck
- (instancetype)init
{
    self = [super init];
    if (self) {
    
        for(NSString *suit in [playingCard validSuit]){
            for(NSUInteger rank=1;rank<=[playingCard maxRank];rank++){
                playingCard *card=[[playingCard alloc] init];
                card.suit=suit;
                card.rank=rank;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
