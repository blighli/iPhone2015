//
//  AppDelegate.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/10.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "AppDelegate.h"
#import "YCTabBarController.h"
#import "YCIndexViewController.h"
#import "YCUserViewController.h"
#import "YCNewPostViewController.h"
#import "SDImageCache.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)APP
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YCTabBarController *tabBarController = [[YCTabBarController alloc] init];
    YCIndexViewController *indexViewController = [[YCIndexViewController alloc] init];
    //YCTableViewController *tableViewController = [[YCTableViewController alloc] init];//测试页面，已隐藏
    YCUserViewController *userViewController = [[YCUserViewController alloc] init];
    YCNewPostViewController *newPostViewController = [[YCNewPostViewController alloc] init];
    tabBarController.viewControllers = @[indexViewController, newPostViewController, userViewController];
    
    for (UIViewController *controller in tabBarController.viewControllers) {
        UIViewController *view = controller.view;//由于视图都是懒加载，不执行这里代码无法加载除了第一项中的其他视图 调用懒加载
    }
    
    _window.rootViewController = tabBarController;
    [_window makeKeyWindow];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //清空图片缓存
    [[SDImageCache sharedImageCache] clearDisk];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[SDImageCache sharedImageCache] clearDisk];
}

@end
