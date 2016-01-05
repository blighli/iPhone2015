//
//  AppDelegate.m
//  音乐播放器
//
//  Created by 张焕 on 12/31/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //后台播放
    AVAudioSession* session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [session setActive:YES error:nil];
    
    //开启远程事件
    [application beginReceivingRemoteControlEvents];
    return YES;
}



- (void)applicationDidEnterBackground:(UIApplication *)application {
    [application beginBackgroundTaskWithExpirationHandler:nil];
}

#pragma mark 接收远程事件
- (void)remoteControlReceivedWithEvent:(UIEvent *)event{
    if(event.type == UIEventTypeRemoteControl){
        self.remoteEventBlock(event);
    }
}

@end
