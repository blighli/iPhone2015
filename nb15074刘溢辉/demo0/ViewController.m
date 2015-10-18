//
//  ViewController.m
//  demo0
//
//  Created by LYH on 15/10/11.
//  Copyright © 2015年 LYH. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@property (nonatomic, assign) int count;
@property (nonatomic, weak) IBOutlet UITextField *textFrame;
-(IBAction)onClick;

@end

@implementation ViewController
- (IBAction)TextFrame:(UITextField *)sender {
}

-(IBAction)onClick
{
    UITextField* frame = self.textFrame;
    self.count ++;
    if (self.count == 5) {
        self.count = 0;
    }
    switch (self.count) {
        case 0:
        {
            frame.text =@"床前明月光";
            frame.backgroundColor = [UIColor yellowColor];
        }
            break;
        case 1:
        {
            frame.text =@"疑是地上霜";
            frame.backgroundColor = [UIColor yellowColor];
        }
            break;
        case 2:
        {
            frame.text =@"举头望明月";
            frame.backgroundColor = [UIColor yellowColor];
        }
            break;
        case 3:
        {
            frame.text =@"低头思故乡";
            frame.backgroundColor = [UIColor yellowColor];
        }
            break;
        case 4:
        {
            frame.text =@"LYHYOKI";
            frame.backgroundColor = [UIColor yellowColor];
        }
            break;
            
        default:
            break;
    }
    self.textFrame = frame;
}

- (IBAction)Button:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.count = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
