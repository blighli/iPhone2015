//
//  ZXLoginViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXLoginViewController.h"
#import "AFNetworking.h"
#import "ZXUser.h"
#import "AppDelegate.h"
#import "ZXRegisterViewController.h"

@interface ZXLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation ZXLoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)exit:(id)sender {
    
}

- (IBAction)toRegister:(id)sender {
    ZXRegisterViewController *registerController = [[ZXRegisterViewController alloc] init];
    [registerController setTitle:@"注册"];
    [self.navigationController pushViewController:registerController animated:YES];
}

- (IBAction)login:(id)sender {
    NSString *username = [_usernameText text];
    NSString *password = [_passwordText text];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"username":username, @"password": password};
    
    [manager POST:@"http://127.0.0.1:8000/report/login/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"NSDictionary!");
            NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:responseObject];
            NSLog(@"%@", dict);
            
            if (responseObject != nil) {
                
                [AppDelegate APP].user = [[ZXUser alloc] init];
                [AppDelegate APP].user.userID = dict[@"id"];
                [AppDelegate APP].user.userName = dict[@"username"];
                [AppDelegate APP].user.password = dict[@"password"];
                
                [AppDelegate APP].user.rootPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents"];
                
                //文件管理器
                NSFileManager *fileManager = [NSFileManager defaultManager];
                
                //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
                [fileManager createDirectoryAtPath:[AppDelegate APP].user.rootPath withIntermediateDirectories:YES attributes:nil error:nil];
                
                [self dismissViewControllerAnimated:YES completion:nil];
                
            }
            
        } else if ([responseObject isKindOfClass:[NSArray class]]) {
            
            NSLog(@"NSArray");
            NSArray *array = [[NSArray alloc] initWithArray:responseObject];
            
            //            _isChange = YES;
            
            NSLog(@"reload ok!");
            
        } else {
            NSLog(@"unknown class of jsonObject");
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }
     ];
    
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
