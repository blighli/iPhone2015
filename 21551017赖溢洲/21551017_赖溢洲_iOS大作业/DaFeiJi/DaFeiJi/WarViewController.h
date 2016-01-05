//
//  WarViewController.h
//  DaFeiJi
//
//  Created by mac on 15-8-7.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUIImageView.h"
@interface WarViewController : UIViewController
{


    UIImageView *topImageView;
    UIImageView *BottomImageView;
    UIImageView *heroImageView;
    NSMutableArray *enemyArray;
    
    NSMutableArray  *zidanArray;
    UITouch *touch;
    CGPoint point;
    MyUIImageView *enemyImageView;
    MyUIImageView   *zidanImageView;
}
@end
