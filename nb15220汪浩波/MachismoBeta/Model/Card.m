//
//  Card.m
//  MachismoBeta
//
//  Created by wanghaobo on 15/10/1.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "Card.h"

@interface Card()//private declarations can go here.
@end


@implementation Card
@synthesize chosen = _chosen;
@synthesize matched = _matched;

- (int)match:(NSArray *)otherCards{
    
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}
@end
