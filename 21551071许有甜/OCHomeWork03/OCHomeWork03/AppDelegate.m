//
//  AppDelegate.m
//  OCHomeWork03
//
//  Created by zhu on 15/10/30.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)addTask:(id)sender
{
    NSString *text = [taskField text];
    if ([text isEqualToString:@""]) {
        return;
    }
    [tasks addObject:text];
    [taskTable reloadData];
    [taskField setText:@""];
    [taskField resignFirstResponder];
    
}
NSString *docPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.txt"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 初始化程序状态，完成相关对象的创建
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        tasks = [plist mutableCopy];
    }
    else{
        tasks = [[NSMutableArray alloc]init];
    }
    
    // 创建应用程序的主窗口
    CGRect windowFrame = [[UIScreen mainScreen]bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    [self setWindow:theWindow];
    self.rootViewController = [[ViewController alloc]init];
    self.window.rootViewController = self.rootViewController;
    [[self window] addSubview:_rootViewController.view];
    
    // 设置三个UI对象的frame属性
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonGrame = CGRectMake(228, 40, 72, 31);
    
    // 创建并设置表格UITableView
    taskTable = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // 创建并设置文本框
    taskField = [[UITextField alloc]initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task,tap Insert"];
    
    // 创建并设置按钮
    insertButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonGrame];
    [insertButton setTitle:@"insert" forState:UIControlStateNormal];
    
    // 为按钮设置回调
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // 将三个UI对象加入UIWindow中
    [[self window] addSubview:taskTable];
    [[self window] addSubview:taskField];
    [[self window]addSubview:insertButton];
    
    // 设置UIWindow的背景颜色，并放到屏幕上
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    [[self window] makeKeyAndVisible];
    
    // 将APPlication Delegate 设置为UITableView的数据源
    [taskTable setDataSource:self];
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tasks count] == 0) {
        [tasks addObject:@"移动互联网与游戏开发技术"];
        [tasks addObject:@"1504班"];
        [tasks addObject:@"许有甜"];
    }
    return [tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSString *item = [tasks objectAtIndex:[indexPath row]];
    [[cell textLabel]setText:item];
    
    return cell;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [tasks writeToFile:docPath() atomically:YES];
}

@end
