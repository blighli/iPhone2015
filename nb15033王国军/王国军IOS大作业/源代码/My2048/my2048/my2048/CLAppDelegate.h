//
//  CLAppDelegate.h
//  my2048
//
//  Created by 王国军 on 15/12/17.
//  Copyright (c) 2015年 王国军. All rights reserved.
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
