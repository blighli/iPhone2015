//
//  YTShareViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/29.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTShareViewController.h"
#import "YTSettingItem.h"
#import "YTSettingGroup.h"
#import <MessageUI/MessageUI.h>

@interface YTShareViewController ()<MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@end

@implementation YTShareViewController

- (void)setupGroup
{
    __unsafe_unretained typeof(self) selfVc = self;
    
    YTSettingItem *webo = [YTSettingItem itemWithIcon:@"WeiboSina" title:@"新浪微博"];
    webo.option = ^{
        NSURL *url = [NSURL URLWithString:@"microblogging://com.netease.microblogging"];
        UIApplication* app = [UIApplication sharedApplication];
        if ([app canOpenURL:url]) {
            // 打开应用
            [app openURL:url];
            
        }
        else{
            // 下载应用
            NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/app/id371634015?mt=8"];
            NSURL *url2 = [NSURL URLWithString:str];
            [app openURL:url2];
        }
    };
    YTSettingItem *message = [YTSettingItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    message.option = ^{
        if (![MFMessageComposeViewController canSendText]) return;
        
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        // 设置短信内容
        vc.body = @"吃饭了没？";
        // 设置收件人列表
        vc.recipients = @[@"18842608965", @"18358401824"];
        // 设置代理
        vc.messageComposeDelegate = selfVc;
        
        // 显示控制器
        [selfVc presentViewController:vc animated:YES completion:nil];
    };

    
    YTSettingItem *mail = [YTSettingItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    mail.option = ^{
        // 不能发邮件
        if (![MFMailComposeViewController canSendMail]) return;
        
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        
        // 设置邮件主题
        [vc setSubject:@"会议"];
        // 设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        // 设置收件人列表
        [vc setToRecipients:@[@"643055866@qq.com"]];
        // 设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        // 设置密送人列表
        [vc setBccRecipients:@[@"56789@qq.com"]];
        
        // 添加附件（一张图片）
        UIImage *image = [UIImage imageNamed:@"lufy.png"];
        NSData *data = UIImagePNGRepresentation(image);
        [vc addAttachmentData:data mimeType:@"image/png" fileName:@"lufy.png"];
        
        // 设置代理
        vc.mailComposeDelegate = selfVc;
        // 显示控制器
        [selfVc presentViewController:vc animated:YES completion:nil];
    };

    YTSettingGroup *group = [[YTSettingGroup alloc] init];
    group.items = @[webo, message, mail];
    [self.data addObject:group];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupGroup];
}

/**
 *  点击取消按钮会自动调用
 */
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
