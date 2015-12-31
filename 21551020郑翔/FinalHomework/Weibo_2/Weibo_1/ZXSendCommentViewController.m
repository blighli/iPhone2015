//
//  ZXSendCommentViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/21.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXSendCommentViewController.h"
#import "ZXCommentTableViewController.h"
#import "AFNetworking.h"
#import "AppDelegate.h"

@interface ZXSendCommentViewController ()

@property (nonatomic, strong) UITextView *textEditor;

@end

@implementation ZXSendCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(toReturn)];
    
    self.navigationItem.leftBarButtonItem = bbi;
    
    UIBarButtonItem *bbi1 = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(sendComment)];
    
    self.navigationItem.rightBarButtonItem = bbi1;
    
    
    //输入框显示区域
    _textEditor = [[UITextView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 200)];
    
    //设置它的代理
//    _textEditor.delegate = self;
    _textEditor.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _textEditor.keyboardType = UIKeyboardTypeDefault;
    _textEditor.font = [UIFont systemFontOfSize:20];
    
    //默认软键盘是在触摸区域后才会打开
    //这里表示进入当前ViewController直接打开软键盘
    [_textEditor becomeFirstResponder];
    
    //把输入框加在视图中
    [self.view addSubview:_textEditor];
    
    //下方的图片按钮 点击后呼出菜单 打开摄像机 查找本地相册
//    UIImage *image = [UIImage imageNamed:@"camera"];
    
//    NSLog(@"image: %@", image);
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    button.frame = CGRectMake(0, 300, image.size.width, image.size.height);
//    
//    [button setImage:image forState:UIControlStateNormal];
//    
//    [button addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
    
    //把它也加在视图当中
//    [self.view addSubview:button];
}

- (void)toReturn {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendComment {
    NSString *urlString = [NSString stringWithFormat:@"http://127.0.0.1:8000/report/sendComment/%@/", [AppDelegate APP].currentWeiboId ];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"user_id": [AppDelegate APP].user.userID, @"comment_text":_textEditor.text};
    
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            NSLog(@"NSDictionary!");
            NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:responseObject];
            NSLog(@"%@", dict);
            //发送成功
            if ([dict[@"result"] compare:@"y"] == 0) {
                _textEditor.text = nil;
//                NSLog(@"%@", self.navigationController.viewControllers);
//                ZXCommentTableViewController *vc = [self.navigationController.viewControllers objectAtIndex:0];
//                [vc loadComment];
//                [vc.tableView reloadData];

                [AppDelegate APP].commentChange = YES;
                NSNotification *notification = [NSNotification notificationWithName:@"RefreshComment" object:nil];
                [[NSNotificationCenter defaultCenter] postNotification: notification];

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
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
