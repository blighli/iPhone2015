//
//  AppDelegate.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-24.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "GameHUD.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
    GameHUD *gameHUD;
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;

@end
