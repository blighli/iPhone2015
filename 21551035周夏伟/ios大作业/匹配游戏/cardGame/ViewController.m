//
//  ViewController.m
//  cardGame
//
//  Created by zhouxw on 12/10/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "ViewController.h"
#import "playingCard.h"
#import "playingDeck.h"
#import "playingCardGame.h"
#import "matchInfoViewController.h"
@interface ViewController ()

@property(nonatomic) int flip;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *playingCardButtons;

@property (weak, nonatomic) IBOutlet UISwitch *switchView;

//@property (weak, nonatomic) IBOutlet UILabel *describeLbl;

@property(nonatomic,strong) Deck *deck;
@property(nonatomic,strong) playingCardGame *game;

@property (weak, nonatomic) IBOutlet UILabel *scoreLbl;
@property (nonatomic) int score;

- (IBAction)restart:(id)sender;
@end

@implementation ViewController

#pragma mark-*****prepareForSegue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showMatchImfo"]){
        if([segue.destinationViewController isKindOfClass:[matchInfoViewController class]]){
            matchInfoViewController *matchInfo=(matchInfoViewController*)segue.destinationViewController;
            matchInfo.matchInfo=[[NSMutableAttributedString alloc] initWithString:self.game.describeInfo];
        }
    }
}
-(playingCardGame *)game{
    if(!_game){
        _game=[[playingCardGame alloc] initWithCardCount:[self.playingCardButtons count]                                                                                           usingDeck:self.deck];
    }
    return _game;
}
-(Deck *)deck{
    if(!_deck){
        _deck=[self createDeck];
    }
    return _deck;
}
-(Deck*)createDeck{
    return [[playingDeck alloc] init];
}
- (IBAction)showCardContents:(id)sender {
    self.game.describeInfo=@"";
    self.switchView.enabled=NO;
    int index=(int)[self.playingCardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index withOn:self.switchView.on];
    self.score=(int)self.game.score;
    [self updateUI];
}
-(void)updateUI{
    for(UIButton *button in self.playingCardButtons){
        int index=(int)[self.playingCardButtons indexOfObject:button];
        Card *card=[self.game cardAtIndex:index];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        button.enabled=!card.matched;
        self.scoreLbl.text=[NSString stringWithFormat:@"score:%d",self.score];
//        self.describeLbl.text=self.game.describeInfo;
    }
}
-(NSString*)titleForCard:(Card*)card{
    return card.isChosen? card.contents:@"";
}
-(UIImage*)imageForCard:(Card*)card{
    return  [UIImage imageNamed:card.isChosen? @"frontCard":@"tiger"];
}
- (IBAction)restart:(id)sender {
    for(int index=0;index<self.playingCardButtons.count;index++){
        Card *card=[self.game cardAtIndex:index];
        card.chosen=NO;
        card.matched=NO;
    }
    [self.game clearScore];
     self.score=0;
    [self updateUI];
    self.switchView.enabled=YES;
    self.game.describeInfo=@"";
//    self.describeLbl.text=@"";
}
@end
