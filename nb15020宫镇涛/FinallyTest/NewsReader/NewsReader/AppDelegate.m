

#import "AppDelegate.h"
#import "LoginPage.h"
#import "AdvertPage.h"
#import "HomePage.h"

@implementation AppDelegate

+ (AppDelegate *)appDeg
{
    return  (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)showHomePage
{
    HomePage *page = [[HomePage alloc] init];

    self.window.rootViewController = page;
    
    [self.window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [AdvertPage showAdvertPage];
    
    NSString *filePath = [FxGlobal getRootPath];
    [FxGlobal setNotBackUp:filePath];
    
    [WXApi registerApp:WXAppID];
    
    [[FxGlobal global].push registerPush];
    [self updateNotification:application];
    
    StatisSetUp();
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    if ([AdvertPage canShowAdvertPage]) {
        [AdvertPage showAdvertPage];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL isSuc = [WXApi handleOpenURL:url delegate:self];
    return  isSuc;
}

-(void) onReq:(BaseReq*)req
{
    if([req isKindOfClass:[GetMessageFromWXReq class]]) {
        BASE_INFO_FUN(@"微信请求App提供内容，App要调用sendResp:GetMessageFromWXResp返回给微信");
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]]) {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        WXMediaMessage *msg = temp.message;
        WXAppExtendObject *obj = msg.mediaObject;
        
        //显示微信传过来的内容
        BASE_INFO_FUN(msg.title);
        BASE_INFO_FUN(msg.description);
        BASE_INFO_FUN(obj.extInfo);
    }
    else if([req isKindOfClass:[LaunchFromWXReq class]]) {
        BASE_INFO_FUN(@"从微信启动");
    }
}

-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]]) {
        BASE_INFO_FUN(([NSString stringWithFormat:@"发送媒体消息结果:%@",@(resp.errCode)]));
    }
}

#pragma mark - APNS

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [[FxGlobal global].push bindDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    BASE_ERROR_FUN(error);
}


#pragma mark Local And Push Notification

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [self showNotification:userInfo];
    [self updateNotification:application];
    [[FxGlobal global].push handleNotification:userInfo];
}

- (void)showNotification:(NSDictionary*)userInfo
{
    NSString *message = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    
    BASE_INFO_FUN(message);
}

- (void)updateNotification:(UIApplication *)application
{
    [application cancelAllLocalNotifications];
    [application setApplicationIconBadgeNumber:0];
}

@end
