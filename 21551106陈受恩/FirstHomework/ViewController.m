//
//  ViewController.m
//  FirstHomework
//
//  Created by 陈受恩 on 15/10/13.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labeltest;

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
- (IBAction)buttonpressed:(id)sender {
    switch (((UIButton *)sender).tag) {
        case 0:
            [self.labeltest setText:@"您点击了Button1！"];
            break;
        case 1:
            [self.labeltest setText:@"您点击了Button2！"];
            break;
        default:
            break;
    }

    
}


@end
