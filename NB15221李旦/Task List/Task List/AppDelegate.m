//
//  AppDelegate.m
//  Task List
//
//  Created by LiDan on 15/11/3.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "AppDelegate.h"
#import "TaskListController.h"

@interface AppDelegate ()
@property (nonatomic,strong) NSMutableArray *arrayCopy;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    TaskListController *tableViewController = [[TaskListController alloc]init];
    self.arrayCopy = [NSMutableArray array];
    NSArray *plist = [NSArray arrayWithContentsOfFile:[self docPath]];
    if (plist)
    {
        tableViewController.array = [plist mutableCopy];
    }
    self.arrayCopy = tableViewController.array;
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tableViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(NSString*)docPath
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.txt"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self.arrayCopy writeToFile:[self docPath] atomically:YES];
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
