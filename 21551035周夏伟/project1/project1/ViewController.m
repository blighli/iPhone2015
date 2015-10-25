//
//  ViewController.m
//  project1
//
//  Created by zhouxw on 10/20/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)clickButton;

@property (weak, nonatomic) IBOutlet UILabel *lbl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton {
    NSString  *text=[NSString stringWithFormat:@"hello 123"];
    [self.lbl setText:text];

}
@end
