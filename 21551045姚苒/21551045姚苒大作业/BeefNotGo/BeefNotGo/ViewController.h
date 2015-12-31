//
//  ViewController.h
//  BeefNotGo
//
//  Created by 幽儿 on 15/12/29.
//  Copyright © 2015年 幽儿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NestCircle;

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (strong,nonatomic) NSMutableArray *allButtonArray;
@property (strong,nonatomic) UIImageView *beefImageView;
@property (strong,nonatomic) NestCircle *beef;
@property int pathNumber,isGameOver;
@end

