//
//  ViewController.h
//  plh_homework1
//
//  Created by apanoo on 15/10/8.
//  Copyright (c) 2015年 Wequeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *buttonPress;
- (IBAction)buttonPress:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *statusLable;
@end

