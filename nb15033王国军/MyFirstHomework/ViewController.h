//
//  ViewController.h
//  MyFirstHomework
//
//  Created by 王国军 on 15/10/17.
//  Copyright (c) 2015年 王国军. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UIButton *btn1;

@property (weak, nonatomic) IBOutlet UIButton *btn2;

- (IBAction)pressBtn:(UIButton *)sender;

@end

