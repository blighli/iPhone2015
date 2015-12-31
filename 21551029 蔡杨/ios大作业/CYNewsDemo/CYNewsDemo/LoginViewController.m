//
//  LoginViewController.m
//  CYNewsDemo
//
//  Created by MAX-TECH on 15/12/16.
//  Copyright © 2015年 fuckcy. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "HomeVC.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *passd;
@property (strong, nonatomic) IBOutlet UIButton *login;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *bgc = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bbbb"]];
    self.view.backgroundColor = bgc;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenKey)];
    [self.view addGestureRecognizer:tap];
    
}
-(void)hiddenKey
{
    [self.name resignFirstResponder];
    [self.passd resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginClick:(id)sender {
    [self.name resignFirstResponder];
    [self.passd resignFirstResponder];
    
    //这里写登录
    if (!(self.name.text.length && self.passd.text.length)){
        UIAlertView *callServices = [[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名和密码不能为空"    delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [callServices  show];
        return;
    }
    if (![self.name.text isEqualToString:@"cy"] || ![self.passd.text isEqualToString:@"cy"]) {
        UIAlertView *callServices = [[UIAlertView alloc] initWithTitle:@"警告" message:@"请按照提示输入用户名和密码"    delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [callServices  show];
        return;
    }
    
    [MBProgressHUD showMessage:@"稍等片刻，就带你飞........."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //移除遮盖
        [MBProgressHUD hideHUD];
        [UIView animateWithDuration:1.5f delay:0.3f options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
            
            HomeVC *vVC = [[HomeVC alloc] init];
            delegate.navigationController = [[UINavigationController alloc] initWithRootViewController:vVC];
            delegate.window.rootViewController = delegate.navigationController;
        } completion:^(BOOL finished) {
            //播放音乐
            //                [LHMusicsTool playMusic:@"login.wav"];
        }];

    });

    
    
    
    
    
    
    
}


- (IBAction)call:(id)sender {
    
    UIAlertController* callServices = [UIAlertController alertControllerWithTitle:@"呼叫me询问密码"
                                                                          message:@"139-0679-3322"
                                                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *CancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                         handler:nil];
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://13906793322"]];
    }];
    [callServices addAction:CancelAction];
    [callServices addAction:OKAction];
    
    [self presentViewController:callServices animated:YES completion:nil];

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
