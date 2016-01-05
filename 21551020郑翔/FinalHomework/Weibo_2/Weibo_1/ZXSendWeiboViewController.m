//
//  ZXSendWeiboViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXSendWeiboViewController.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "ZXTableViewController.h"

@interface ZXSendWeiboViewController ()
@property (weak, nonatomic) IBOutlet UITextView *weiboText;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sendBtn;

@end

@implementation ZXSendWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)send:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"user_id": [AppDelegate APP].user.userID, @"weibo_text":_weiboText.text};
    
    [manager POST:@"http://127.0.0.1:8000/report/send_weibo/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"NSDictionary!");
            NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:responseObject];
            NSLog(@"%@", dict);
            //发送成功
            if ([dict[@"result"] compare:@"y"] == 0) {
                _weiboText.text = nil;
                ZXTableViewController *vc = [self.tabBarController.viewControllers objectAtIndex:0];
                [vc loadWeibo];
            }
            else {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"发送失败！" message:nil preferredStyle:UIAlertControllerStyleAlert];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
