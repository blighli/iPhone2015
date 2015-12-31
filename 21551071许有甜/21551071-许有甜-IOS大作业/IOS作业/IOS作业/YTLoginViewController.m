//
//  YTLoginViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/24.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTLoginViewController.h"
#import "MBProgressHUD+YT.h"
#import <sqlite3.h>
#import "YTUser.h"

@interface YTLoginViewController()
{
    sqlite3 *_database;
}
@property (weak, nonatomic) IBOutlet UITextField *accountView;
@property (weak, nonatomic) IBOutlet UITextField *pwdView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *rmbPWDSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

- (IBAction)rmbPWDChanged:(UISwitch *)sender;
- (IBAction)autoLoginChanged:(UISwitch *)sender;
- (IBAction)login:(UIButton *)sender;

@end

@implementation YTLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledChanged) name:UITextFieldTextDidChangeNotification object:self.accountView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledChanged) name:UITextFieldTextDidChangeNotification object:self.pwdView];
    
    UIImage* bg = [UIImage imageNamed:@"bg_login"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bg];

    [self textFiledChanged];
    
    // 读取上次配置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.accountView.text = [defaults objectForKey:YTAccountKey];
    self.rmbPWDSwitch.on = [defaults boolForKey:YTRmbPwdKey];
    self.autoLoginSwitch.on = [defaults boolForKey:YTAutoLoginKey];
    
    if (self.rmbPWDSwitch.isOn) {
        self.pwdView.text = [defaults objectForKey:YTPwdKey];
    }
    if (self.autoLoginSwitch.isOn) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self login:nil];
        });
        
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (![self.accountView isExclusiveTouch] && ![self.pwdView isExclusiveTouch]) {
        [self.accountView resignFirstResponder];
        [self.pwdView resignFirstResponder];
        [self.view endEditing:YES];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textFiledChanged
{
    self.loginBtn.enabled = (self.accountView.text.length && self.pwdView.text.length);
}

- (IBAction)rmbPWDChanged:(UISwitch *)sender {
    if (!self.rmbPWDSwitch.isOn) {
        self.autoLoginSwitch.on = NO;
    }
}

- (IBAction)autoLoginChanged:(UISwitch *)sender {
    if (self.autoLoginSwitch.isOn) {
        self.rmbPWDSwitch.on = YES;
    }
}

- (IBAction)login:(UIButton *)sender {
    
    
    if (![self queryUser:self.accountView.text]) {
        [MBProgressHUD showError:@"账号错误" toView:self.view];
        return;
    }
    if (![self queryUser:self.pwdView.text]) {
        [MBProgressHUD showError:@"密码错误" toView:self.view];
        return;
    }
    // 存数数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.rmbPWDSwitch.isOn forKey:YTRmbPwdKey];
    [defaults setBool:self.autoLoginSwitch.isOn forKey:YTAutoLoginKey];
    
    if (self.rmbPWDSwitch.isOn) {
        [defaults setObject:self.pwdView.text forKey:YTPwdKey];
        [defaults setObject:self.accountView.text forKey:YTAccountKey];
    }
    [defaults synchronize];
    
    [MBProgressHUD showMessage:@"加载中"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)),dispatch_get_main_queue(),^{
        [MBProgressHUD hideHUD];
        
        [self performSegueWithIdentifier:@"login2contact" sender:nil];
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

- (BOOL)queryUser:(NSString *)str
{
    if ([self isOpenedDB]) {
        const char* sql = [NSString stringWithFormat:@"select account,userPWD from t_user where '%@' = ?;",str].UTF8String;
        
        // 定义一个stmt存放结果集
        sqlite3_stmt *stmt = NULL;
        
        // 检测sql语句的合法性
        int result = sqlite3_prepare_v2(_database, sql, -1, &stmt, NULL);
        if (result == SQLITE_OK) {
            NSLog(@"OK");
        
            // 设置占位符内容
            sqlite3_bind_text(stmt, 1,str.UTF8String, -1, NULL);
            
            int stepResult = sqlite3_step(stmt);
            if (stepResult == SQLITE_ROW) {
                return YES;
            }
        }
        else{
            NSLog(@"非法");
        }
    }
    return NO;
}
@end
