//
//  WordNoteMacro.h
//  WordNote
//
//  Created by 常惠源 on 10/29/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#ifndef WordNote_WordNoteMacro_h
#define WordNote_WordNoteMacro_h

#pragma mark --- ios system



#define MIS_ABOVE_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)

#define MSYSTEM_VERSION                              ([[[UIDevice currentDevice] systemVersion] floatValue])

#define MSYSTEM_VERSION_STRING                       ([[UIDevice currentDevice] systemVersion])

#define MSYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

#define MSYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define MSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define MSYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define MSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#pragma mark -- device size
#define MIPHONE6_WIDTH        375
#define MIPHONE6PLUS_WIDTh    414
#define MIPHONE5_WIDTH        320



#define MSCREEN_BOUNDS       ([UIScreen mainScreen].bounds)
#define MSCREEN_SIZE         ([UIScreen mainScreen].bounds.size)
#define MSCREEN_WIDTH        ([UIScreen mainScreen].bounds.size.width)
#define MSCREEN_HEIGHT       ([UIScreen mainScreen].bounds.size.height)






#define  MTabBarHeight                  (MSCREEN_WIDTH==414?146/3.0:48)
#define  MNavBarHeight                  (MIS_ABOVE_IOS7?(MSCREEN_WIDTH==414?186/3.0:64):44)
#define  MStatusBarHeight               (MIS_ABOVE_IOS7 ? 0 : 20)

#define  MVIEWRightEdgesOriginX(view)       (view.frame.origin.x+view.frame.size.width)
#define  MVIEWBottomEdgesOriginY(view)      (view.frame.origin.y+view.frame.size.height)
#define  MVIEWWIDTH(view)                   (view.frame.size.width)
#define  MVIEWHEIGHT(view)                  (view.frame.size.height)
#define  MVIEWOriginY(view)                 (view.frame.origin.y)
#define  MVIEWOriginX(view)                 (view.frame.origin.x)

//
#define GENERAL_LEFT_MARGIN 6.0f
#define GENERAL_TOP_MARGIN 6.0f

// 说明性View的边距，相比通用边距会比较大
#define MENU_LEFT_MARGIN 30.0f
#define MENU_TOP_MARGIN 30.0f

#define GENERAL_BTN_HEIGHT 40.0f

// card背景的图片放缩inset，不可修改
#define BG_TOP_MARGION 19.0f
#define NEWS_BG_BOTTOM_MARGION 29.0f
#define BG_LEFT_MARGION 8.0f

#define PROFILE_FACE_WIDTH      100.0f
#define PROFILE_FACE_HEIGHT     100.0f

#define SYS_MENU_RIGHT_MARGIN   70

#define ITEM_IMG_SIZE   68.0f

#define FACE_IMG_WIDTH 68.0f
#define FACE_IMG_HEIGHT 68.0f

#define FONT_SIZE 15
#define NAV_FONT_SIZE 15

#define TEXT_FONT 17

#define FACE_DEAL_IMG_WIDTH 45.0f
#define FACE_DEAL_IMG_HEIGHT 45.0f

#define TITLE_HEIGHT 35

#define SEGMENT_BAR_HEIGHT 44

#define CELL_TOP_MARGIN 8

#define NAVI_BAR_HEIGHT 60
#define DEAL_FONT_SIZE 11

#define BOTTOM_BTN_BAR_HEIGHT   48



#pragma mark ---UIFont


#define   MSYSTEM_FONT(FontSize)                           ([UIFont systemFontOfSize:FontSize])
#define   MSYSTEM_BOLD_FONT(FontSize)                      ([UIFont boldSystemFontOfSize:FontSize])
#define   MCUSTOMFONT(FontName,FontSize)                   ([UIFont fontWithName:FontName size:FontSize])




#pragma mark --UIColor

#define MCOLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define MTabBarColor        MCOLOR(26, 164, 242, 1.0)
#define MNavBarColor        MCOLOR(26, 164, 242, 1.0)
#define MCLEARCOLOR         [UIColor clearColor]
#define MBlackColor         [UIColor blackColor]
#define MWhiteColor         [UIColor whiteColor]
#define WRedColor           [UIColor redColor]





/**
 * 颜色定义
 */
#define graywhite                       @"F5F5F5"
#define gray                            @"808080"
#define title_bg_red                    @"ea413c"
#define tuhao_gold                      @"c6a354"
#define vote_blue                       @"05b0ee"
#define lottery_red                     @"e94153"
#define official_lottery_red            @"b03029"
#define official_lottery_dark_red       @"681b17"
#define yellow_listbg                   @"fbf7ec"
#define yellow_lb                       @"dca123"
#define black_pencil                    @"636363"
#define gray_listbg                     @"e5e5e5"
#define hornor_red                      @"ea6f54"
#define bind_master_red                 @"e52e16"
#define vote_option_blue                @"0088ff"
#define vote_option_green               @"00ff00"
#define vote_option_purple              @"dd00ff"
#define vote_option_red                 @"ff6600"
#define vote_option_yellow              @"ffcc00"
#define vote_cmt_user_black             @"4c5f70"
#define text_color                      @"6e6e6e"
#define back_yellow                     @"f7f6f1"
#define cell_gray                       @"e7e7e7"




#pragma mark --others  common  macro

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif



//使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif


//程序的本地化,引用国际化的文件
#define MMyLocal(x, ...) NSLocalizedString(x, nil)
//G－C－D
#define MBACKGCD(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MMAINGCD(block) dispatch_async(dispatch_get_main_queue(),block)

//NSUserDefaults 实例化
#define MUSER_DEFAULT [NSUserDefaults standardUserDefaults]


//由角度获取弧度 有弧度获取角度
#define MdegreesToRadian(x) (M_PI * (x) / 180.0)
#define MradianToDegrees(radian) (radian*180.0)/(M_PI)



#endif
