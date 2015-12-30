//
//  TestChoiceViewController.h
//  DriveTestHelper
//
//  Created by wp on 15/12/16.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestChoiceViewController : UIViewController

@property(copy,nonatomic) NSString *viewTitle;
@property(copy,nonatomic) NSArray *dataArr;
@property(assign,nonatomic) int type;//1:章节；2:专项

@end
