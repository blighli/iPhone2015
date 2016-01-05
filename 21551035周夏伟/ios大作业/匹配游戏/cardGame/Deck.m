//
//  Deck.m
//  cardGame
//
//  Created by zhouxw on 12/10/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "Deck.h"
#import "playingCard.h"
@interface Deck()
@end
@implementation Deck
-(NSMutableArray *)cards{
    if(!_cards){
        _cards=[[NSMutableArray alloc] init];
    }
    return _cards;
}
-(void)addCard:(Card*)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
};
-(void)addCard:(Card *)card{
    [self.cards addObject:card];
};
-(Card *)drawRandomCard{
    Card *card=nil;
    if([self.cards count]){
        unsigned index=arc4random()%[self.cards count];
       card=self.cards[index];
        [self.cards removeObjectAtIndex:index];
        
    }
    return card;
};

@end
