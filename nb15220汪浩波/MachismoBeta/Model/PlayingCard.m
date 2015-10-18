//
//  PlayingCard.m
//  MachismoBeta
//
//  Created by wanghaobo on 15/10/1.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
+ (NSArray *)validSuits{
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
    
}
+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@synthesize suit = _suit;

- (NSString *)suit{
    return _suit ? _suit : @"?";
}
- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
+ (NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}
- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}
@end
