//
//  ViewController.m
//  FirstAssignment
//
//  Created by Xin on 11/10/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *someLabel;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)buttonPressed:(id)sender {
    switch (((UIButton *)sender).tag) {
        case 0:
            [self.someLabel setText:@"action1"];
            break;
        case 1:
            [self.someLabel setText:@"action2"];
            break;
        default:
            break;
    }
}

@end
