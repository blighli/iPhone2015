//
//  ViewController.m
//  HMWHomework3
//
//  Created by zhuzhu on 15/10/31.
//  Copyright © 2015年 wequeen. All rights reserved.
//

#import "ViewController.h"
NSString *SaveToPath()
{
    NSArray *path_list =NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory,NSUserDomainMask,YES);
    return [[path_list objectAtIndex:0]stringByAppendingPathComponent:@"data.txt"];
}


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *plist = [NSArray arrayWithContentsOfFile:SaveToPath()];
    if(plist)
    {
        tasks = [plist mutableCopy];
    }
    else
    {
        tasks = [[NSMutableArray alloc]init];
    }
    
    //创建应用程序的主窗口
    CGRect window_frame = [[UIScreen mainScreen] bounds];
    UIWindow *the_window =[[UIWindow alloc] initWithFrame:window_frame];
    [self setWindow:the_window];
    
    //设置三个UI对象的frame属性
    CGRect table_frame = CGRectMake(0, 80, 320, 380);
    CGRect field_frame = CGRectMake(20, 40, 200, 31);
    CGRect button_frame =CGRectMake(228, 40, 72, 31);
    
    //创建并设置表格UITableView
    task_table = [[UITableView alloc]initWithFrame:table_frame
                                             style:UITableViewStylePlain];
    [task_table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    //将AppDelegate设置为UITableView的数据源
    [task_table setDataSource:self];
    
    //创建并设置文本框（UITextField）
    task_field = [[UITextField alloc]initWithFrame:field_frame];
    [task_field setBorderStyle:UITextBorderStyleRoundedRect];
    [task_field setPlaceholder:@"Type a task,tap Insert"];
    
    //创建并设置按钮（UIButton）
    insert_button= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insert_button setFrame:button_frame];
    [insert_button setTitle:@"Insert" forState:UIControlStateNormal];
    
    //为按钮设置回调
    [insert_button addTarget:self action:@selector(AddTask:) forControlEvents:UIControlEventTouchUpInside];
    
    //将三个UI对象加入UIWindow中
    [[self view] addSubview:task_table];
    [[self view] addSubview:task_field];
    [[self view] addSubview:insert_button];
    
    //设置UIWindow的背景颜色，并放到屏幕上
    [[self view] setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)AddTask:(id)sender
{
    NSString *text = [task_field text];
    if([text isEqualToString:@""])
    {
        return;
    }
    [tasks addObject:text];
    [task_table reloadData];
    [task_field setText:@""];
    [task_field resignFirstResponder];
}
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([tasks count]==0)
    {
        [tasks addObject:@"Walk the dog"];
        [tasks addObject:@"Get oil changed"];
        [tasks addObject:@"Wrangle some cows"];
    }
    return [tasks count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [task_table dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    NSString *item = [tasks objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item];
    return cell;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [tasks writeToFile:SaveToPath() atomically:YES];
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


@end
