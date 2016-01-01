//
//  AppDelegate.m
//  FlapFlap
//
//  Created by dilemmaxk on 15/12/15.
//  Copyright © 2015年 dilemmaxk. All rights reserved.
//


#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

  ViewController *viewController = [[ViewController alloc] init];
  [_window setRootViewController:viewController];

  [_window setBackgroundColor:[UIColor whiteColor]];
  [_window makeKeyAndVisible];
  return YES;
}

@end
