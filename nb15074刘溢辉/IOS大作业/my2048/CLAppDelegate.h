//
//  CLAppDelegate.h
//  my2048
//
//  Created by LYH on 15/12/29.
//  Copyright © 2015年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"

@interface CLAppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate>
{
    NSString* _wbtoken;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *wbtoken;
@end
