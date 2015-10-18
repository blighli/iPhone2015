//
//  ViewController.h
//  MyFirstApp
//
//  Created by wp on 15/10/4.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UIButton *btn1;

@property (weak, nonatomic) IBOutlet UIButton *btn2;

- (IBAction)pressBtn:(UIButton *)sender;


@end

