//
//  STLuckyController.m
//  ItcastLottery01
//
//  Created by 123 on 15/12/24.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STLuckyController.h"
#import "STWheel.h"

@interface STLuckyController ()

@end

@implementation STLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //背景图片
    UIImageView *backgroundImg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LuckyBackground"]];
    backgroundImg.frame=CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-104);
    [self.view addSubview:backgroundImg];
    
    //转盘
    STWheel *wheel=[STWheel wheel];
    wheel.center=CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.5);
    
    [self.view addSubview:wheel];
    
    //按钮背景
    UIImageView *menuImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LuckyThreeButton"]];
    menuImage.frame=CGRectMake(80, 120, 261, 120);
    [self.view addSubview:menuImage];
    
    //按钮
    UILabel *btnLeft=[[UILabel alloc]init];
    btnLeft.frame=CGRectMake(menuImage.frame.origin.x+12, menuImage.frame.origin.y+65, 55, 30);
    btnLeft.text=@"双色球";
    btnLeft.textColor=[UIColor whiteColor];
    btnLeft.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:btnLeft];
    
    UILabel *btnMiddle=[[UILabel alloc]init];
    btnMiddle.frame=CGRectMake(btnLeft.frame.origin.x+96, btnLeft.frame.origin.y-40, 55, 30);
    btnMiddle.text=@"星座";
    btnMiddle.textColor=[UIColor whiteColor];
    btnMiddle.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:btnMiddle];
    
    UILabel *btnRight=[[UILabel alloc]init];
    btnRight.frame=CGRectMake(btnMiddle.frame.origin.x+106, btnMiddle.frame.origin.y+43, 55, 30);
    btnRight.text=@"5注";
    btnRight.textColor=[UIColor whiteColor];
    btnRight.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:btnRight];
}


@end
