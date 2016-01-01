//
//  playingCardGame.m
//  cardGame
//
//  Created by zhouxw on 12/12/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "playingCardGame.h"
@interface playingCardGame()
@property (nonatomic,readwrite) NSUInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@end
@implementation playingCardGame

-(void)clearScore{
    self.score=0;
}
-(NSMutableArray *)cards{
    if(!_cards){
        _cards=[[NSMutableArray alloc] init];
    }
    return _cards;
}
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck{
    self=[super init];
    if(self){
        for(int index=0;index<count;index++){
            Card *card=[deck drawRandomCard];
            [self.cards addObject:card];
        }
    }
    return self;
};
-(Card *)cardAtIndex:(NSUInteger)index{
    return index<[self.cards count]? self.cards[index]:nil;
};
static const int MATCH_BONUS=4;
static const int MISMATCH_PEANLTY=2;
static const int FLIP_COST=1;

-(void)chooseCardAtIndex:(NSUInteger)index withOn:(BOOL)on{
    Card *card=[self cardAtIndex:index];
    if(card){
        if(!card.isMatched){
            if(card.isChosen){
                card.chosen=NO;
            }else{
                if(!on){
                 [self doubleMatch:card];
                }else{
                [self tripleMatch:card withCards:self.cards];
                }
            }
        }
    }
};
-(NSString*)matchDescribeInfoWith:(Card*)card andCard:(Card*)otherCard{
    NSString *desc=nil;
    if([card match:@[otherCard]]){
        desc=[[card.contents stringByAppendingString:@" is mathed with "] stringByAppendingString:otherCard.contents];
    }else{
        desc=[[card.contents stringByAppendingString:@" is not matched with "] stringByAppendingString:otherCard.contents];
    }
    return desc;
}
-(void)doubleMatch:(Card*)card{
    _score-=FLIP_COST;
    for(Card *otherCard in self.cards){
        if(otherCard.isChosen && !otherCard.isMatched){
            int matchScore=[card match:@[otherCard]];
            self.describeInfo=[self matchDescribeInfoWith:card andCard:otherCard];
           
            if (matchScore) {
                _score+=matchScore* MATCH_BONUS;
                otherCard.matched=YES;
                card.matched=YES;
                break;
            }else{
                otherCard.chosen=NO;
                _score-=MISMATCH_PEANLTY;
            }
        }
    }
    card.chosen=YES;
   
}

-(void)tripleMatch:(Card*)card withCards:(NSArray *)cards{
    _score-=FLIP_COST;
    int mark1=-1;//标记第一个满足isChosen && !isMatched的位置
    int mark2=-1;//标记第二个满足isChosen && !isMatched的位置
    for(Card *otherCard in self.cards){
        if(otherCard.isChosen && !otherCard.isMatched){
            if(mark1<0){
                mark1=(int)[self.cards indexOfObject:otherCard];
            }else{
                mark2=(int)[self.cards indexOfObject:otherCard];
            }
    
        }
    }
    if(mark1>=0&&mark2>=0){
        Card *card1= self.cards[mark1];
        Card *card2=self.cards[mark2];
        if(![card match:@[card1,card2]]&&![card1 match:@[card2]]){
            card1.chosen=NO;
            card2.chosen=NO;
            self.score-=2;
        }else{
            if([card match:@[card1]]&&[card match:@[card2]]){
                self.score+=20;
            }else{
                self.score+=10;
            }
            self.describeInfo= [[[self matchDescribeInfoWith:card andCard:card1] stringByAppendingString:[self matchDescribeInfoWith:card andCard:card2]] stringByAppendingString:[self matchDescribeInfoWith:card1 andCard:card2]];
//            NSLog(@"%@",self.describeInfo);
            card.matched=YES;
            card1.matched=YES;
            card2.matched=YES;
        }
    }else{
        mark1=-1;
        mark2=-1;
    }
    card.chosen=YES;
   
}


@end
