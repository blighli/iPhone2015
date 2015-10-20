//
//  ViewController.h
//  ButtonFun
//
//  Created by paomer on 15/10/14.
//  Copyright (c) 2015年 zjumsexk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)buttonPressed:(UIButton *)sender;

@end

