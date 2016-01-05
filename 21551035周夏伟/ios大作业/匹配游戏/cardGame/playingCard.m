//
//  playingCard.m
//  cardGame
//
//  Created by zhouxw on 12/10/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "playingCard.h"

@implementation playingCard

-(void)setSuit:(NSString *)suit{
    if([playingCard validSuit]){
        _suit=suit;
    }
}
-(NSString *)contents{
    NSArray *rankString=[playingCard rankString];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}
+(NSArray *)validSuit{
    return @[@"♣",@"♠",@"♥︎",@"♦"];
};
+(NSArray*)rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(NSUInteger)maxRank{
    return [[playingCard rankString] count]-1;
};

static const int RANK_MATCH=4;
static const int SUIT_MATCH=2;
-(int)match:(NSArray *)cards{
    unsigned score=0;
    for(playingCard* othercard in cards){
        if(othercard.rank==self.rank){
            score+=RANK_MATCH;
        }else if([othercard.suit isEqualToString:self.suit]){
            score+=SUIT_MATCH;
        }
    }
    return score;
};

@end
