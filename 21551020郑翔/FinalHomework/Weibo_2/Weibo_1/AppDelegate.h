//
//  AppDelegate.h
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXUser.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ZXUser *user;
@property (nonatomic, strong) NSMutableDictionary *hasImgDict;
@property (nonatomic, strong) NSString *currentWeiboId;
@property (nonatomic, assign) BOOL commentChange;
@property (nonatomic, assign) BOOL weiboChange;
+(AppDelegate *)APP;

@end

