//
//  YTSignUpViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/24.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTSignUpViewController.h"
#import "MBProgressHUD+YT.h"
#import "YTUser.h"
#import <sqlite3.h>
@interface YTSignUpViewController()
{
    sqlite3 *_database;
}
- (IBAction)returnBtnClick:(UIButton *)sender;

- (IBAction)signUpBtnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField1;
@property (weak, nonatomic) IBOutlet UITextField *pwdField2;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;

@end

@implementation YTSignUpViewController

- (void)viewDidLoad
{
    UIImage* bg = [UIImage imageNamed:@"bg_login"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bg];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledChanged) name:UITextFieldTextDidChangeNotification object:self.accountField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledChanged) name:UITextFieldTextDidChangeNotification object:self.pwdField1];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledChanged) name:UITextFieldTextDidChangeNotification object:self.pwdField2];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (![self.accountField isExclusiveTouch] && ![self.pwdField1 isExclusiveTouch] && ![self.pwdField2 isExclusiveTouch]) {
        [self.accountField resignFirstResponder];
        [self.pwdField1 resignFirstResponder];
        [self.pwdField2 resignFirstResponder];
        
        [self.view endEditing:YES];
    }
}

- (void)textFiledChanged
{
    self.signUpBtn.enabled = (self.accountField.text.length && self.pwdField1.text.length && self.pwdField2.text.length);
}

- (IBAction)returnBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)signUpBtnClick:(UIButton *)sender {
    if (![self.pwdField1.text isEqualToString:self.pwdField2.text]) {
        [MBProgressHUD showError:@"密码输入不一致" toView:self.view];
        return;
    }
    // 存数数据
    YTUser *user = [[YTUser alloc] init];
    user.account = self.accountField.text;
    user.userPWD = self.pwdField1.text;
    
    [self saveUser:user];
    
    [MBProgressHUD showMessage:@"注册成功"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)),dispatch_get_main_queue(),^{
        [MBProgressHUD hideHUD];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    });
    
    
}

- (BOOL)isOpenedDB
{
    // 创建/打开数据库
    int result = sqlite3_open(YTUserFilePath.UTF8String, &_database);
    if ( result == SQLITE_OK) {
        // 创建表
        const char *sql = "create table if not exists t_user (id integer primary key autoincrement, account text, userPWD text);";
    
        char * errorMSM = NULL;
        int result = sqlite3_exec(_database, sql, NULL, NULL, &errorMSM);
        if (result == SQLITE_OK) {
            NSLog(@"OK");
        }
        else{
            NSLog(@"创建表失败:%s",errorMSM);
            return NO;
        }
    }
    else
    {
        NSLog(@"创建数据库失败");
        return NO;
    }
    return YES;
}

- (void)saveUser:(YTUser *)user
{
    if ([self isOpenedDB]) {
        NSString* sql = [NSString stringWithFormat: @"insert into t_user ( account, userPWD ) values ( '%@', '%@')",user.account, user.userPWD];
        char * errorMSM = NULL;
        int result = sqlite3_exec(_database, sql.UTF8String, NULL, NULL, &errorMSM);
        if (result == SQLITE_OK) {
            NSLog(@"OK");
        }
        else{
            NSLog(@"创建表失败:%s",errorMSM);
        }
        
        // 查询
        sql = @"select account, userPWD from t_user;";
        
        // 定义一个stmt存放结果集
        sqlite3_stmt *stmt = NULL;
        
        // 检测sql语句的合法性
        result = sqlite3_prepare_v2(_database, sql.UTF8String, -1, &stmt, NULL);
        if (result == SQLITE_OK) {
            NSLog(@"OK");
            
//            while (sqlite3_step(stmt) == SQLITE_ROW) {
//                int _id = sqlite3_column_int(stmt, 0);
//                char *_name = (char *)sqlite3_column_text(stmt, 1);
//                NSString *name = [NSString stringWithUTF8String:_name];
//                char *_name1 = (char *)sqlite3_column_text(stmt, 1);
//                NSString *name1 = [NSString stringWithUTF8String:_name1];
//                NSLog(@"id=%i, name=%@, age=%@", _id, name, name1);
//            }

        }
        else{
            NSLog(@"非法");
        }
    }
}

@end
