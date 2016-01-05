//
//  STShareViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/30.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STShareViewController.h"
#import "STSettingArrowItem.h"
#import "STSettingGroup.h"
#import "MessageUI/MessageUI.h"

@interface STShareViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation STShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // __weak STShareViewController *share=self;
    __weak typeof(self)selfVc=self;
    STSettingItem *sina=[STSettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪微博" destVcClass:nil];
    
    STSettingItem *sms=[STSettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享" destVcClass:nil];
    sms.option=^{
        MFMessageComposeViewController *vc=[[MFMessageComposeViewController alloc]init];
        //设置短信内容
        vc.body=@"吃饭了没?";
        //设置收件人列表
        vc.recipients=@[@"10010",@"02010010"];
        //设置代理
        vc.messageComposeDelegate=selfVc;
        //显示控制器
        [selfVc presentViewController:vc animated:YES completion:nil];
        
//        NSURL *url=[NSURL URLWithString:@"sms://10010"];
//        [[UIApplication sharedApplication]openURL:url];
    };
    
    //__unsafe_unretained STShareViewController *share=self;
    
    STSettingItem *mail=[STSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享" destVcClass:nil];
    mail.option=^{
        //不能发邮件
        if (![MFMailComposeViewController canSendMail]) return ;
        
        MFMailComposeViewController *vc=[[MFMailComposeViewController alloc]init];
        
        //设置邮件主题
        [vc setSubject:@"会议"];
        //设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        //设置收件人列表
        [vc setToRecipients:@[@"345264@qq.com"]];
        //设置抄送人列表
        [vc setCcRecipients:@[@"yweg@qq.com"]];
        //设置密送人列表
        [vc setBccRecipients:@[@"sgfuew@qq.com"]];
        
        //添加附件（一张图片）
        UIImage *image=[UIImage imageNamed:@"lify.jpeg"];
        NSData *data=UIImageJPEGRepresentation(image, 0.5);
        [vc addAttachmentData:data mimeType:@"image/jpeg" fileName:@"lify.jpeg"];
        
        //设置代理
        vc.mailComposeDelegate=selfVc;
        
        //显示控制器
        [selfVc presentViewController:vc animated:YES completion:nil];
    };
    
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=@[sina,sms,mail];
    [self.data addObject:group];
}
/**
 点击取消按钮会自动调用
 */
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
