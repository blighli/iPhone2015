//
//  ViewController.h
//  Helloios
//
//  Created by HacAdmin on 15/10/10.
//  Copyright (c) 2015年 HacAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)buttonPressed:(UIButton *)sender;

@end

