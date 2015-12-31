//
//  AppDelegate.h
//  MyTaskList
//
//  Created by apanoo on 15/11/1.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;                     // key window
@property (strong, nonatomic) ViewController* rootViewController;   // rootController

@end

