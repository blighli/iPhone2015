//
//  YCNewPostViewController.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/13.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCNewPostViewController.h"
#import "AFNetworkTool.h"
#import "YCPermission.h"
#import "AppDelegate.h"
#import "YCUser.h"
#import "YCAPIManager.h"
#define tabBarItemFont [UIFont systemFontOfSize:18]

@interface YCNewPostViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtViewNewPost;
- (IBAction)btnSendPost:(id)sender;

@end

@implementation YCNewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //在程序底部显示一个“发布”
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发布";
    NSDictionary *attr = @{NSFontAttributeName: tabBarItemFont};
    [self.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    self.tabBarItem.title = @"发布";
    
    //设置显示多行文本框边框
    self.txtViewNewPost.layer.borderColor = [[UIColor blackColor] CGColor];
    self.txtViewNewPost.layer.borderWidth = 1;
    self.txtViewNewPost.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSendPost:(id)sender {
    //如果有发表文章的权限
    if (([[AppDelegate APP].user can:[YCPermission WRITE_ARTICLES]]))
    {
        NSDictionary *paramDict = @{@"body": self.txtViewNewPost.text};
        [[YCAPIManager sharedManager] setUsername:[AppDelegate APP].user.email_or_token andPassword:[AppDelegate APP].user.password];
        //[[YCAPIManager sharedManager] setToken:@"eyJhbGciOiJIUzI1NiIsImV4cCI6MTQ1MDA3ODcxMiwiaWF0IjoxNDUwMDc1MTEyfQ.eyJpZCI6Mjd9.DbeQawXU_UcnVnycne4JAN1Ao9XHkJuDFjo06zxdKNk"];
        [[YCAPIManager sharedManager] POST:@"/api/v1.0/posts/" parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self sendMsg:@"发送成功"];
            self.txtViewNewPost.text = @"";
            //发送成功之后，使用通知刷新一下首页内容 成功yes
            //通知中心是桥梁，既可以post发送消息，也可以addObserver接收消息
            NSNotification *notification = [NSNotification notificationWithName:@"returnToIndex" object:nil];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            // error stuff here
            [self sendMsg:@"发送失败"];
        }];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"非登录用户" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //失败处理
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:^{
            //
        }];
    }
}

- (void)sendMsg:(NSString *)text
{
    //创建“发送成功”或“发送失败”动画
    UILabel *lblMsgSuccess = [[UILabel alloc] init];
    lblMsgSuccess.frame = CGRectMake(125, 250, 125, 50);
    lblMsgSuccess.alpha = 1.0;
    lblMsgSuccess.text = text;
    [lblMsgSuccess setTextAlignment:NSTextAlignmentCenter];
    lblMsgSuccess.layer.masksToBounds = YES;
    lblMsgSuccess.layer.cornerRadius = 5;
    lblMsgSuccess.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lblMsgSuccess];
    [self.view bringSubviewToFront:lblMsgSuccess];
    [UIView animateWithDuration:2.5 animations:^{
        //一秒之内的活动
        lblMsgSuccess.alpha = 0;
    } completion:^(BOOL finished) {
        //完成任务销毁
        [lblMsgSuccess removeFromSuperview];
    }];
}

@end
