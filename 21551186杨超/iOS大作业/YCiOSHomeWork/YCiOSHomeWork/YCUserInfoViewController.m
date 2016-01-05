//
//  YCUserInfoViewController.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/13.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCUserInfoViewController.h"
#import "YCNewAvatarViewController.h"
#import "AppDelegate.h"
#import "YCUser.h"
#import "UIImageView+WebCache.h"
#import "AFHTTPRequestOperationManager.h"
#import "YCAPIManager.h"
#import "SDImageCache.h"

@interface YCUserInfoViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,retain) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIButton *btnAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lblID;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblMember_since;
@property (weak, nonatomic) IBOutlet UILabel *lblLast_seen;
@property (weak, nonatomic) IBOutlet UILabel *lblPost_count;
- (IBAction)btnAvatar:(id)sender;
@end

@implementation YCUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarItem.title = @"个人资料";
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, 375, 60);
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.title = @"个人资料";
    navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(btnBacktoUser:)];
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    [self.view addSubview:navigationBar];
    
    [self loadUserInfo];
}

//加载用户信息
- (void)loadUserInfo
{
    //产生头像不同步的原因是：这里的头像读取的是登陆时候的头像url，
    //而在服务器端修改头像之后，如果url变化了（即头像文件夹变化了），读取的内容就不一样了
    YCUser *user = [AppDelegate APP].user;
    NSURL *avatarUrl = [NSURL URLWithString:user.image_url];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:avatarUrl];
    NSLog(@"%f", imageView.image.size.width);//75
    NSLog(@"%f", imageView.image.size.height);//75
    [self.btnAvatar setBackgroundImage:imageView.image forState:UIControlStateNormal];
    self.lblID.text = [NSString stringWithFormat:@"%d", user.id];
    self.lblUserName.text = user.username;
    self.lblEmail.text = user.email;
    self.lblMember_since.text = user.member_since;
    self.lblLast_seen.text = user.last_seen;
    self.lblPost_count.text = [NSString stringWithFormat:@"%d", user.post_count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBacktoUser:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnAvatar:(id)sender {
    //初始化图片器选择控件
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.view.backgroundColor = [UIColor orangeColor];
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    self.imagePicker.sourceType = sourceType;
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    
    [self presentViewController:self.imagePicker animated:YES completion:^{
        //code
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    [self.btnAvatar setBackgroundImage:image forState:UIControlStateNormal];
    NSLog(@"%f", image.size.width);
    NSLog(@"%f", image.size.height);
    
    NSData *imgData = UIImageJPEGRepresentation(image, 0.3);
    NSLog(@"%ld", imgData.length);//大概几十K
    
    
    //向服务器上传头像
    [[YCAPIManager sharedManager] setUsername:[AppDelegate APP].user.email_or_token andPassword:[AppDelegate APP].user.password];
    NSString *url = [NSString stringWithFormat:@"/api/v1.0/avatar/%d", [AppDelegate APP].user.id];
    [[YCAPIManager sharedManager] POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSString *imgName = [NSString stringWithFormat:@"%@.jpg", [AppDelegate APP].user.username];
        [formData appendPartWithFileData:imgData name:@"file" fileName:imgName mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //成功之后清空SDWebImage的缓存，重新生成新的头像缓存，必须两个方法一起用
        [[SDImageCache sharedImageCache] clearDisk];
        [[SDImageCache sharedImageCache] clearMemory];
        NSLog(@"成功");
        //清空图片缓存之后，重新加载首页，用通知的方式
        NSNotification *notification = [[NSNotification alloc] initWithName:@"returnToIndex" object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
        NSLog(@"%@", error);
    }];
    
    //销毁"图片选择"视图
    [self dismissViewControllerAnimated:self.imagePicker completion:^{
        //code
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //销毁图片选择视图
    [self dismissViewControllerAnimated:self.imagePicker completion:^{
        //code
    }];
}

@end
