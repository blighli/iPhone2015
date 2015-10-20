//
//  Card.h
//  MachismoBeta
//
//  Created by wanghaobo on 15/10/1.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic)NSString* contents;

@property (nonatomic,getter = isChosen) BOOL chosen;
@property (nonatomic,getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;
@end
