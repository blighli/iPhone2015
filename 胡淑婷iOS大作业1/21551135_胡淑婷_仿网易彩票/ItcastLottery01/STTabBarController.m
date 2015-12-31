//
//  STTabBarController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/26.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STTabBarController.h"
#import "STTabBar.h"
#import "STTabBarButton.h"

@interface STTabBarController()<STTabBarDelegate>

@end

@implementation STTabBarController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.添加自己的tabbar
    STTabBar *myTabBar=[[STTabBar alloc]init];
    myTabBar.delegate=self;
    myTabBar.frame=self.tabBar.bounds;
    [self.tabBar addSubview:myTabBar];
    
    //2.添加对应个数的按钮
    for (int i=0; i<self.viewControllers.count; i++) {
        NSString *name=[NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selName=[NSString stringWithFormat:@"TabBar%dSel",i+1];
        [myTabBar addTabButtonWithName:name selName:selName];
    }
}


#pragma mark-STTabBar的代理方法
-(void)tabBar:(STTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    //选中最新的控制器
    self.selectedIndex=to;
}
@end
