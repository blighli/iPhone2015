//
//  YCLoginViewController.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/11.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCLoginViewController.h"
#import "YCUserViewController.h"
#import "YCTabBarController.h"
#import "YCUser.h"
#import "AppDelegate.h"

@interface YCLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)loginTouched:(id)sender;

@end

@implementation YCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarItem.title = @"登录";
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, 375, 60);
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backToUser)];
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    [self.view addSubview:navigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)finished:(FinishedLogin)finished{
    _finished = finished;
}

//返回
- (void)backToUser
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginTouched:(id)sender {
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if (![self.email.text isEqualToString:@""] && ![self.password.text isEqualToString:@""]) {
        NSDictionary *param = @{@"email_or_token": self.email.text, @"password":self.password.text};
        
        [YCUser getUser:param success:^(YCUser *user) {
            //异步：登录成功，将User信息赋值到单例
            //如果在getUser中进行user赋值，由于是异步，在这个地方无法进行判断user不为空判断，无法进行代理方法的绑定！
            [AppDelegate APP].user = user;
            NSLog(@"登录了%@", user);
            //登录成功之后，让主页面执行代理方法
            if ([AppDelegate APP].user != NULL) {
                if ([self.delegate respondsToSelector:@selector(ShowUserInfoWithUserName:)]) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                    [self.delegate ShowUserInfoWithUserName:[AppDelegate APP].user.username];
                    //这种代理方法直接将控制器自身传递过去，用tag标识每一个子控件，得到txtUserName控件，访问用户名
                    [self.delegate ShowUserInfoWithYCLoginViewController:self];
                }
            }
            
        } failed:^(NSError *error) {
            //t提示失败信息
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"登录失败" preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //失败处理
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:^{
                //
            }];
            
        }];
    }
}

@end
