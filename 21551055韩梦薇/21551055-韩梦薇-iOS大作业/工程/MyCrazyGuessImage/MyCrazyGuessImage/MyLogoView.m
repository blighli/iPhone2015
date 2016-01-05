//
//  MyLogoView.m
//  MyCrazyGuessImage
//
//  Created by zhuzhu on 15/12/28.
//  Copyright © 2015年 wequeen. All rights reserved.
//

#import "MyLogoView.h"

@implementation MyLogoView
- (IBAction)start {
    [self performSegueWithIdentifier:@"startMission" sender:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBarHidden = YES;
}
@end
