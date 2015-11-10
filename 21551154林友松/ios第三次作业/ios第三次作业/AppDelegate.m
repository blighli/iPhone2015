//
//  AppDelegate.m
//  ios第三次作业
//
//  Created by lysongzi on 15/11/10.
//  Copyright © 2015年 lysongzi. All rights reserved.
//

#import "AppDelegate.h"

//辅助函数的实现
NSString *docPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - 应用委托对象的回调方法

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    //创建一个空的任务
    //self.tasks = [NSMutableArray array];
    //读取已经有的数据,如果不存在该文件，则新建任务数组
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        self.tasks = [plist mutableCopy];
    } else{
        self.tasks = [NSMutableArray array];
    }
    
    //创建并设置window
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    
    //创建viewcontroller,并设置为window的根视图控制器
    UIViewController *vc = [[UIViewController alloc] init];
    self.window.rootViewController = vc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //初始化三个控件
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    self.tableTask = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.tableTask.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableTask registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    //设置tableview的数据源
    self.tableTask.dataSource = self;
    
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap Insert";
    
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    //为按钮添加注册action
    [self.insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    //将三个子视图添加到window中
    [self.window addSubview:self.tableTask];
    [self.window addSubview:self.taskField];
    [self.window addSubview:self.insertButton];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.tasks writeToFile:docPath() atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 管理表格视图

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //直接返回任务数组中的对象个数
    return [self.tasks count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //检查是否有可以重用的CELL
    UITableViewCell *cell = [self.tableTask dequeueReusableCellWithIdentifier:@"Cell"];
    
    //根据数组中元素设置文本
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    cell.textLabel.text = item;
    return cell;
}

#pragma mark - Action

- (void) addTask:(id)sender
{
    
    //获取输入的文本内容
    NSString *text = [self.taskField text];
    
    //如果没有输入则直接返回
    if ([text length] == 0) {
        return;
    }
    
    //NSLog(@"Task enter:%@" , text);
    //将新数据添加到数据源中
    [self.tasks addObject:text];
    [self.tableTask reloadData];
    
    //取消键盘的输入焦点
    [self.taskField setText:@""];
    [self.taskField resignFirstResponder];
}

@end
