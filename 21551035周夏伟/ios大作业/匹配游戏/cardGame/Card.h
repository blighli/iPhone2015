//
//  Card.h
//  cardGame
//
//  Created by zhouxw on 12/10/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property(nonatomic,copy) NSString *contents;
@property(nonatomic,getter=isChosen) BOOL chosen;
@property(nonatomic,getter=isMatched) BOOL matched;
-(int)match:(NSArray *)cards;
@end
