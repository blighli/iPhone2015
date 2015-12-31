//
//  ZXRegisterViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXRegisterViewController.h"
#import "AFNetworking.h"

@interface ZXRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText1;
@property (weak, nonatomic) IBOutlet UITextField *passwordText2;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation ZXRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submit:(id)sender {
    NSString *username = [_usernameText text];
    NSString *password = [_passwordText1 text];
    NSString *rePwd = [_passwordText2 text];
    
    
    
    if ([rePwd compare:password]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"两次密码不正确" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else {
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *parameters = @{@"username":username, @"password": password};
        
        [manager POST:@"http://127.0.0.1:8000/report/register/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSLog(@"NSDictionary!");
                NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:responseObject];
                NSLog(@"%@", dict);
                
                if ([dict[@"result"] compare:@"y"] == 0) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                } else {
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"用户名已存在" message:nil preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:alertAction];
                    [self presentViewController:alertController animated:YES completion:nil];
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
