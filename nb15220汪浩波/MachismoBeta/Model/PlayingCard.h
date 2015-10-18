//
//  PlayingCard.h
//  MachismoBeta
//
//  Created by wanghaobo on 15/10/1.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic,strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
