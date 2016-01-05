//
//  JYWBTabBarViewController.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/17.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYWBTabBarViewController.h"
#import "JYHomeTableViewController.h"
#import "JYMessageTableViewController.h"
#import "JYSquareTableViewController.h"
#import "JYMeTableViewController.h"
#import "JYTabBar.h"
#import "JYUINavigationController.h"

@interface JYWBTabBarViewController ()<JYTabBarDelegate>
//自定义的tabbar
@property(nonatomic,weak)JYTabBar *customTabBar;
@end

@implementation JYWBTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.初始化Tabbar
    [self setupTabbar];

    //2.初始化所有的子控制器
    [self setupAllChildViewControllers];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //把系统自带的删除
    for(UIView *child in self.tabBar.subviews)
    {
        if([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
}
//初始化Tabbar
-(void)setupTabbar
{
    JYTabBar *customTabBar=[[JYTabBar alloc]init];
    customTabBar.delegate=self;
    customTabBar.frame=self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar=customTabBar;
}

-(void)tabBar:(JYTabBar *)tabBar didSelectItemFrom:(long)from to:(long)to
{
    self.selectedIndex=to;
}

-(void)setupAllChildViewControllers
{
    //1.首页
    JYHomeTableViewController *home=[[JYHomeTableViewController alloc]init];
    //home.tabBarItem.badgeValue=@"1";
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home_os7" selectedImageName:@"tabbar_home_selected_os7"];
    
    //2.消息
    JYMessageTableViewController *message=[[JYMessageTableViewController alloc]init];
    //message.tabBarItem.badgeValue=@"22";
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center_os7" selectedImageName:@"tabbar_message_center_selected_os7"];
    //3.广场
    JYSquareTableViewController *discover=[[JYSquareTableViewController alloc]init];
   // discover.tabBarItem.badgeValue=@"new";
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover_os7" selectedImageName:@"tabbar_discover_selected_os7"];
    //4.我
    JYMeTableViewController *me=[[JYMeTableViewController alloc]init];
  //  me.tabBarItem.badgeValue=@"88888";
    [self setupChildViewController: me title:@"我" imageName:@"tabbar_profile_os7" selectedImageName:@"tabbar_profile_selected_os7"];
}

//初始化一个子控制器
-(void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName
              selectedImageName:(NSString *)selectedImageName
{
    //1.设置控制器的属性
    childVc.title=title;
    childVc.tabBarItem.image=[UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //2.包装一个导航控制器
    JYUINavigationController *nav=[[JYUINavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    //3.添加tabbar
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

@end
