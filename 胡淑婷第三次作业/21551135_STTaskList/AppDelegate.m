//
//  AppDelegate.m
//  21551135_STTaskList
//
//  Created by 123 on 15/10/31.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSArray *plist=[NSArray arrayWithContentsOfFile:docPath()];
    if (plist)
    {
        tasks=[plist mutableCopy];
    }
    else
    {
        tasks=[[NSMutableArray alloc]init];
        [tasks addObject:@"Walk the dogs"];
        [tasks addObject:@"Feed the hogs"];
        [tasks addObject:@"Chop the logs"];
    }
    //创建应用程序的主窗口（UIWindow）
    CGRect windowFrame=[[UIScreen mainScreen]bounds];
    UIWindow *theWindow=[[UIWindow alloc]initWithFrame:windowFrame];
    [self setWindow:theWindow];
    
    //实例化一个ViewController的实例，并设置成window的rootViewController
    UIViewController *vc=[[UIViewController alloc]init];
    [[self window] setRootViewController:vc];
    //设置UIWindow的背景颜色，并放到屏幕上
    [[self window] setBackgroundColor:[UIColor whiteColor]];
    [[self window] makeKeyAndVisible];


    //设置3个UI对象的frame属性
    CGFloat w=self.window.frame.size.width;
    CGFloat h=self.window.frame.size.height;
    
    CGRect tableFrame=CGRectMake(0, 80, w, h);
    CGRect fieldFrame=CGRectMake(20, 40,w*0.7, 31);
    CGRect buttonFrame=CGRectMake(w*0.75, 40, 72, 31);
    
    //创建并设置表格UITableView
    taskTable=[[UITableView alloc]initWithFrame:tableFrame
                                          style:UITableViewStylePlain];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    //创建并设置文本框（UITextField)
    taskField=[[UITextField alloc]initWithFrame:fieldFrame];
    taskField.userInteractionEnabled=YES;
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task,tap Insert"];
    
    //创建并设置按钮(UIButton)
    insertButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [insertButton setFrame:buttonFrame];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    //为按钮设置回调
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    //将3个UI对象加入UIWindow中
    [[self window]addSubview:taskTable];
    [[self window]addSubview:taskField];
    [[self window]addSubview:insertButton];
    
    //设置数据源
    [taskTable setDataSource:self];
    
    
    return YES;
}

#pragma mark-数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //向数据源预先填入数据
//    if ([tasks count]==0)
//    {
//        [tasks addObject:@"Walk the dogs"];
//        [tasks addObject:@"Feed the hogs"];
//        [tasks addObject:@"Chop the logs"];
//    }
    
    UITableViewCell *cell=[taskTable dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSString *item=[tasks objectAtIndex:[indexPath row]];
    [[cell textLabel]setText:item];
    return cell;
}
//添加新的任务
-(void)addTask:(id)sender
{

    NSString *text=[taskField text];//从输入框获取新的任务
    if ([text isEqualToString:@""]) {
        return;//如果是空的什么液不做
    }
    [tasks addObject:text];//将新的任务添加到模型
    [taskTable reloadData];//表格视图重新载入数据
    [taskField setText:@""];//清空输入框
    [taskField resignFirstResponder];//关闭软键盘
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
//当应用程序退出时保存数据
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [tasks writeToFile:docPath() atomically:YES];
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
NSString *docPath()
{
    NSArray *pathList=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0]stringByAppendingPathComponent:@"data.txt"];
}
@end
