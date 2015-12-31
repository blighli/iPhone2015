//
//  ViewController.h
//  Button Fun
//
//  Created by 毛毛 on 15/10/26.
//  Copyright © 2015年 毛毛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (IBAction)buttonPressed:(UIButton *)sender;

@end

