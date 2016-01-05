//
//  YCNewAvatarViewController.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/23.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCNewAvatarViewController.h"

@interface YCNewAvatarViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic,retain) UIImagePickerController *imagePicker;
- (IBAction)btnNewAvatar:(id)sender;

@end

@implementation YCNewAvatarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, 375, 60);
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
    [navigationBar pushNavigationItem:navigationItem animated:YES];
    [self.view addSubview:navigationBar];
    
    //初始化图片选择控件
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.view.backgroundColor = [UIColor orangeColor];
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    self.imagePicker.sourceType = sourceType;
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    
}

- (void)goBack
{
    [self dismissViewControllerAnimated:self completion:^{
        //code
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"%@", info);
    [self dismissViewControllerAnimated:self.imagePicker completion:^{
        //code
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    NSLog(@"%@", image);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:self.imagePicker completion:^{
        //code
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNewAvatar:(id)sender {
    [self presentViewController:self.imagePicker animated:YES completion:^{
        //code
    }];
}
@end
