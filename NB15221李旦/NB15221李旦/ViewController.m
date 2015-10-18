//
//  ViewController.m
//  NB15221李旦
//
//  Created by LiDan on 15/10/9.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "ViewController.h"

// RGB颜色
#define SelfColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define RandomColor SelfColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelText;
- (IBAction)textBtn:(id)sender;
- (IBAction)colorBtn:(id)sender;
- (IBAction)backgroundBtn:(id)sender;

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

- (IBAction)textBtn:(id)sender
{
    self.labelText.text = @"Hello iOS,Hello Objective-C!";
}

- (IBAction)colorBtn:(id)sender
{
    self.labelText.textColor = RandomColor;
}

- (IBAction)backgroundBtn:(id)sender
{
    self.labelText.backgroundColor = RandomColor;
}
@end
