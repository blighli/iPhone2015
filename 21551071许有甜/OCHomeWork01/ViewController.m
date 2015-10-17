//
//  ViewController.m
//  OCHomeWork01
//
//  Created by zhu on 15/10/8.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,assign) int count;
@property (nonatomic,weak) IBOutlet UITextField *textFrame;
-(IBAction)onClick;

@end

@implementation ViewController

-(IBAction)onClick
{

    UITextField* frame = self.textFrame;
    self.count++;
    
    if (self.count == 4) {
        self.count = 0;
    }
    switch (self.count) {
        case 0:
        {
            frame.text =@"移动互联网与游戏开发技术";
            frame.backgroundColor = [UIColor redColor];
        }
            break;
        case 1:
        {
            frame.text =@"1504班";
            frame.backgroundColor = [UIColor greenColor];
        }
            break;
        case 2:
        {
            frame.text =@"学号：21551071";
            frame.backgroundColor = [UIColor magentaColor];
            
        }
            break;
        case 3:
        {
            frame.text =@"许有甜";
            frame.backgroundColor = [UIColor yellowColor];
        }
            break;
        default:
            break;
    }
    self.textFrame = frame;

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
