//
//  MainTabBarController.m
//  CloudMusic
//
//  Created by LiDan on 15/12/6.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "FindController.h"
#import "AccountController.h"
#import "FriendsController.h"
#import "MyMusicController.h"
#import "CloudMusic.pch"

@implementation MainTabBarController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    FindController *findVc = [[FindController alloc]init];
    MyMusicController *myMusicVc = [[MyMusicController alloc]init];
    FriendsController *friendVc = [[FriendsController alloc]init];
    AccountController *accountVc = [[AccountController alloc]init];
    
    
    [self addChildVC:findVc title:@"发现音乐" imageName:@"cm2_btm_icn_discovery" selectedImageName:@"cm2_btm_icn_discovery_prs"];
    [self addChildVC:myMusicVc title:@"我的音乐" imageName:@"cm2_btm_icn_music" selectedImageName:@"cm2_btm_icn_music_prs"];
    [self addChildVC:friendVc title:@"朋 友" imageName:@"cm2_btm_icn_friend" selectedImageName:@"cm2_btm_icn_friend_prs"];
    [self addChildVC:accountVc title:@"账 号" imageName:@"cm2_btm_icn_account" selectedImageName:@"cm2_btm_icn_account_prs"];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"cm2_btm_bg"]];
    [self.tabBar setSelectedImageTintColor:[UIColor whiteColor]];
    self.tabBar.backgroundColor = RGBColor(220, 220, 220);
    
    self.selectedIndex = 1;
    
}

-(void) addChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}

@end
