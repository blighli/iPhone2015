//
//  Card.m
//  cardGame
//
//  Created by zhouxw on 12/10/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "Card.h"

@implementation Card
-(int)match:(NSArray *)cards{
    unsigned score=0;
    for(Card* card in cards){
        if ([card.contents isEqualToString:self.contents]){
            score++;
        }
    }
    return score;
};
@end
