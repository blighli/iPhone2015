//
//  YCLoginViewController.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/11.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKAlert.h"
#import "MBProgressHUD.h"
#import "YCUser.h"
@class YCUserViewController;
@class YCLoginViewController;

typedef void (^FinishedLogin)(YCUser *user);

@protocol YCLoginViewControllerDelegate <NSObject>
@required
- (void)ShowUserInfoWithUserName:(NSString *) userName;
- (void)ShowUserInfoWithYCLoginViewController:(YCLoginViewController *)loginViewController;
@end

@interface YCLoginViewController : UIViewController
{
    FinishedLogin _finished;
}
@property (nonatomic,strong) id<YCLoginViewControllerDelegate> delegate;
@end
