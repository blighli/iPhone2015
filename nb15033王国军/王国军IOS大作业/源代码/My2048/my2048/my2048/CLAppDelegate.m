//
//  CLAppDelegate.m
//  my2048
//
//  Created by 王国军 on 15/12/17.
//  Copyright (c) 2015年 王国军. All rights reserved.
//

#define kAppKey @"2500021022"
#define kAppSecret @"8ad79cf6580689e11849407b15d5d06a"
#define kAppRedirectURL @"https://api.weibo.com/oauth2/default.html"

#import "CLAppDelegate.h"
#import "CLMainViewController.h"

@implementation CLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    CLMainViewController *mainCtl=[[CLMainViewController alloc]init];
    self.window.rootViewController=mainCtl;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //注册新浪微博
    [WeiboSDK registerApp:kAppKey];
    [WeiboSDK enableDebugMode:YES];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {
    
    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        if (response.statusCode==WeiboSDKResponseStatusCodeSuccess) {
        NSString *title = nil;
        NSString *message = @"分享成功";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        }
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        if (response.statusCode==WeiboSDKResponseStatusCodeSuccess) {
        NSString *title = nil;
        NSString *message = @"授权成功";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        
        self.wbtoken = [(WBAuthorizeResponse *)response accessToken];
        
        [alert show];
        [[NSUserDefaults standardUserDefaults] setObject:self.wbtoken forKey:@"acessToken"];
    }
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

/*
 * 推荐实现上面的方法，两个方法二选一实现即可
 - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
 {
 return [ WeiboSDK handleOpenURL:url delegate:self ];
 }
 */
@end
