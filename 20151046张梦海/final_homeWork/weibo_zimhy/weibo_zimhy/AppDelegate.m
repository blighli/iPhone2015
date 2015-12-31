//
//  AppDelegate.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/15.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "AppDelegate.h"
#import "ZMHTabBarController.h"
#import "ZMHOAuthViewController.h"
#import "ZMHAccountTool.h"
#import "ZMHAccount.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds] ;
    self.window.backgroundColor = [UIColor yellowColor] ;
    
    
    // 注册通知
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [application registerUserNotificationSettings:setting];
    

    
    
    // 选择根控制器
    // 判断下有没有授权
    if ([ZMHAccountTool account]) { // 已经授权
        
        // 选择根控制器
        self.window.rootViewController = [[ZMHTabBarController alloc] init] ;
        
    }else{ // 进行授权
        ZMHOAuthViewController *oauthVc = [[ZMHOAuthViewController alloc] init];
        
        // 设置窗口的根控制器
        self.window.rootViewController = oauthVc;
        
    }
    
    
    
    // 显示窗口
    [self.window makeKeyAndVisible];
    // makeKeyAndVisible底层实现
    // 1. application.keyWindow = self.window
    // 2. self.window.hidden = NO;
    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
