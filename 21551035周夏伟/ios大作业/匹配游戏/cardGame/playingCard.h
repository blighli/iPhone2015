//
//  playingCard.h
//  cardGame
//
//  Created by zhouxw on 12/10/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "Card.h"

@interface playingCard : Card
@property(nonatomic,copy) NSString *suit;
@property(nonatomic) NSUInteger rank;
+(NSArray *)validSuit;
+(NSUInteger)maxRank;
@end
