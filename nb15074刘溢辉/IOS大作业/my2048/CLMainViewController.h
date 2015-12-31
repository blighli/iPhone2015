//
//  CLMainViewController.h
//  my2048
//
//  Created by LYH on 15/12/29.
//  Copyright © 2015年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import <AudioToolbox/AudioToolbox.h>

#define kOneLabelwidth 67.5
#define kOneLabelHeight 65
#define kPlaceX @"X"
#define kPlaceY @"Y"
#define kHaveSameNumberLabel 10
#define kHaveNoLabel 20
#define kHaveDifferentLabel 30

#define kRight 1
#define kLeft 2
#define kUp 3
#define kDown 4

@interface CLMainViewController : UIViewController<UIAlertViewDelegate,WBHttpRequestDelegate>
{
    SystemSoundID swipSoundID;
}
@property (nonatomic,strong) NSMutableArray *currentExistArray;
@property (nonatomic,strong) NSMutableArray *emptyPlaceArray;
@property (nonatomic,strong) NSArray *labelArray;
//@property (nonatomic,strong) NSArray *testArray;

@property(nonatomic)BOOL  R_1;
@property(nonatomic)BOOL  R_2;
@property(nonatomic)BOOL  R_3;
@property(nonatomic)BOOL  R_4;

@property(nonatomic)BOOL  C_1;
@property(nonatomic)BOOL  C_2;
@property(nonatomic)BOOL  C_3;
@property(nonatomic)BOOL  C_4;

@property(nonatomic)BOOL canBornNewLabel;
@property(nonatomic)BOOL isOver;
@end
