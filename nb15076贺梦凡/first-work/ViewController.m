//
//  ViewController.m
//  first-work
//
//  Created by AbelTowne on 15/10/14.
//  Copyright © 2015年 AbelTowne. All rights reserved.
//

#import "ViewController.h"
#import "demo.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *FlipsLabel;
@property (nonatomic) int flipsCount;
@end

@implementation ViewController
- (void)setFlipCount:(int)flipsCount{
    _flipsCount = flipsCount;
    self.FlipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipsCount];
    NSLog(@"%d",self.flipsCount);
}
- (void)test{
    demo *d = [[demo alloc]init];
    [d nsDemo];
    [demo pfDemo];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)click:(UIButton *)sender {
    self.flipsCount++;
    NSLog(@"%d",self.flipsCount);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
