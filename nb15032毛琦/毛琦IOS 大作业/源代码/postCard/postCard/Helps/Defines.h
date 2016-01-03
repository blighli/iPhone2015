//
//  Defines.h
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#ifndef postCard_Defines_h
#define postCard_Defines_h

#pragma mark 版本及其他信息
//版本及其他信息
#define IOS7    ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7.0)
#define IOS8    ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=8.0)
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CURRENT_SYSTEMVERSION ([[UIDevice currentDevice] systemVersion])
#define CURRENTLANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

//屏幕宽高
#define ScreenWidth     [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight    [[UIScreen mainScreen] bounds].size.height

//cell宽高
#define CELLWIDTH  ScreenWidth / 3.7f
#define CELLHEIGHT ScreenHeight / 6.3f

//view宽高
#define VIEW_WIDTH(view)  view.frame.size.width
#define VIEW_HEIGHT(view) view.frame.size.height
#define VIEW_ORIGIN_X(v)  v.frame.origin.x
#define VIEW_ORIGIN_Y(v)  v.frame.origin.y


#endif
