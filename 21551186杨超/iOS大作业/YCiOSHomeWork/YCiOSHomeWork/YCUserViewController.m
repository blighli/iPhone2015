//
//  YCUserViewController.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/11.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCUserViewController.h"
#import "YCLoginViewController.h"
#import "YCUserInfoViewController.h"
#import "AppDelegate.h"
#define tabBarItemFont [UIFont systemFontOfSize:18]

@interface YCUserViewController ()<YCLoginViewControllerDelegate>

@property (nonatomic,assign) Boolean isLogon;
@property (nonatomic,weak) UILabel *lblUserName;
@property (nonatomic,weak) UIBarButtonItem *leftbarButtonItem;
@property (nonatomic,weak) UIBarButtonItem *rightbarButtonItem;

@end

@implementation YCUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //可以从子视图中调用该视图所在的tabBarController
    //    NSLog(@"%i",self.tabBarController == self.parentViewController);
    //
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我";
    self.tabBarItem.title = @"我";
    NSDictionary *attr = @{NSFontAttributeName: tabBarItemFont};
    [self.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    [self addNavigationBar];
}

- (void)addNavigationBar
{
    UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, 375, 60);
    [self.view addSubview:navigationBar];
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.title = @"关于我";
    UIBarButtonItem *leftbarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStyleDone target:self action:@selector(login)];
    UIBarButtonItem *rightbarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"个人资料" style:UIBarButtonItemStyleDone target:self action:@selector(showMe)];
    
    self.rightbarButtonItem = rightbarButtonItem;
    self.rightbarButtonItem.enabled = NO;
    self.leftbarButtonItem = leftbarButtonItem;
    navigationItem.leftBarButtonItem = leftbarButtonItem;
    navigationItem.rightBarButtonItem = rightbarButtonItem;
    // 把navigationItem加到navigationBar中
    [navigationBar pushNavigationItem:navigationItem animated:NO];
}

- (void)login
{
    if (!self.isLogon) {//登录
        YCLoginViewController *loginViewController = [[YCLoginViewController alloc] initWithNibName:@"YCLoginViewController" bundle:[NSBundle mainBundle]];
        loginViewController.delegate = self;
        [self presentViewController:loginViewController animated:YES completion:nil];
    }else{
        //系统消息 是否注销？
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定注销？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        //取消注销按钮
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
        [alertController addAction:cancelAction];
        //确定注销按钮
        UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            //点击之后的事件
            NSLog(@"点击事件");
            [AppDelegate APP].user = NULL;
            NSLog(@"%@", [AppDelegate APP].user);
            self.isLogon = false;
            self.leftbarButtonItem.title = @"登录";
            self.rightbarButtonItem.enabled = false;
        }];
        
        [alertController addAction:yesAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

//显示个人资料
- (void)showMe
{
        if (self.isLogon) {
            YCUserInfoViewController *userInfoViewController = [[YCUserInfoViewController alloc] init];
            //userInfoViewController.userInfo = self.lblUserName.text;
            [self presentViewController:userInfoViewController animated:YES completion:nil];
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ShowUserInfoWithUserName:(NSString *)userName
{
    //导航栏左侧按钮变成“注销”
    UILabel *lblUserName = [[UILabel alloc] init];
    lblUserName.text = userName;
    [lblUserName setTextAlignment:NSTextAlignmentCenter];
    lblUserName.frame = CGRectMake(125, 250, 125, 30);
    self.lblUserName = lblUserName;
    [self.view addSubview:lblUserName];
    
    self.isLogon = YES;
    self.leftbarButtonItem.title = @"注销";
    self.rightbarButtonItem.enabled = YES;
}

- (void)ShowUserInfoWithYCLoginViewController:(YCLoginViewController *)loginViewController
{
    for (UIView *view in [loginViewController.view subviews]) {
        if (view.tag == 1) {
            UITextField *txtUserName = (UITextField *)view;
            NSString *userName = txtUserName.text;
            NSLog(@"%@",userName);
        }
    }
}

@end
