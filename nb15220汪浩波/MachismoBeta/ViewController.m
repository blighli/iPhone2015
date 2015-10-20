//
//  ViewController.m
//  MachismoBeta
//
//  Created by wanghaobo on 15/10/1.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "ViewController.h"
#import "playingCardDeck.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic,strong) Deck *deck;

@end

@implementation ViewController
- (Deck *)deck{
    if (!_deck)_deck = [self createDeck];
    return _deck;
}
- (Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"%d",self.flipCount);
}
- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    }else{
        Card *randomCard = [self.deck drawRandomCard];
        if (randomCard){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
