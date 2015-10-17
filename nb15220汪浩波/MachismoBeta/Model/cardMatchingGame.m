//
//  cardMatchingGame.m
//  MachismoBeta
//
//  Created by wanghaobo on 15/10/1.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "cardMatchingGame.h"
#import "PlayingCardDeck.h"
@interface cardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards; //of card
@end
@implementation cardMatchingGame
- (NSMutableArray *)cards{
    
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}// lazy instantiation
- (instancetype)initWithCardCount:
(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if (self){
        for (int i=0 ; i <count ; i++){
            Card *randomCard = [deck drawRandomCard];
            if (randomCard){
                [self.cards addObject:randomCard];
            }else{
                self = nil;
                break;
            }
            
        }
    }
    return self;
}
- (Card *)cardAtIndex:(NSUInteger)index{
    return self.cards[index];
}
@end
