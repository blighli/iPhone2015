//
//  AppDelegate.m
//  MyTask_List
//
//  Created by YC－MacBookPro on 15/11/1.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITableViewDataSource,UITableViewDelegate>

NSString *docPath(void);

@end

@implementation AppDelegate

NSString *docPath()
{
    NSArray *pathlist = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //return [[pathlist firstObject] stringByAppendingPathComponent:@"data.plist"];
    return [[pathlist objectAtIndex:0] stringByAppendingPathComponent:@"data.plist"];
}

//懒加载数据
- (NSMutableArray *)tasks
{
    if (!_tasks) {
        NSString *path = docPath();
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSString *str in arr) {
            [arrM addObject:str];
        }
        _tasks = arrM;
    }
    return _tasks;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //打印地址
    NSLog(@"%@",docPath());
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
    
    CGRect viewFrame = CGRectMake(0, 0, 320, 80);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    CGRect tableFrame = CGRectMake(0, 80, 320, 488);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [tableView setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    tableView.dataSource = self;
    tableView.delegate = self;
    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _taskTable = tableView;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:buttonFrame];
    [button setTitle:@"Insert" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    _taskButton = button;
    
    UITextField *textField = [[UITextField alloc] initWithFrame:fieldFrame];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    _taskField = textField;
    
    UIView *view = [[UIView alloc] initWithFrame:viewFrame];//将按钮和文本框放在同一个view中
    view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:0.7];
    [view addSubview:_taskField];
    [view addSubview:_taskButton];
    
    UIViewController *mainViewController = [[UIViewController alloc] init];
    [mainViewController.view addSubview:_taskTable];
    [mainViewController.view addSubview:view];
    [mainViewController.view bringSubviewToFront:view];
    //[mainViewController.view addSubview:_taskField];
    //[mainViewController.view addSubview:_taskButton];
    
    //如果没有数据，则先加载
    if (self.tasks.count == 0) {
        [self.tasks addObject:@"Make a big news"];
        [self.tasks addObject:@"I am angry!"];
        [self.tasks addObject:@"Run faster than anyone!"];
    }
    
    //为键盘添加弹出事件
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(KeyBoardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    //点击键盘以外空白区域隐藏键盘方法
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [mainViewController.view addGestureRecognizer:tapGr];
    
    _window.rootViewController = mainViewController;
    [_window makeKeyAndVisible];
    return YES;
}

//实现键盘隐藏方法
-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [self.taskField endEditing:YES];
}

#pragma mark -
#pragma mark 实现键盘弹出/回收事件
- (void)KeyBoardWillChangeFrame:(NSNotification *)noteInfo
{
    CGRect newRect = [noteInfo.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboard_y = newRect.origin.y;
    
    //NSLog(@"%f",keyboard_y);
    
    if (keyboard_y == 568) {//键盘回收下移tableview
        [UIView animateWithDuration:0.5 animations:^{
            self.taskTable.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
    }else if ( _tasks.count*44 > (_window.frame.size.height - keyboard_y)) {//键盘弹出上移tableview
        
        CGFloat translationY = _window.frame.size.height - keyboard_y - _tasks.count*44 - 20;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.taskTable.transform = CGAffineTransformMakeTranslation(0, translationY);
        }];
    }
    NSIndexPath *idp = [NSIndexPath indexPathForRow:(_tasks.count - 1) inSection:0];
    [_taskTable scrollToRowAtIndexPath:idp atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark -
#pragma mark 实现按钮点击事件
- (void)addTask:(id)sender
{
    NSString *text = _taskField.text;
    if ([text isEqualToString:@""]) {
        return;
    }
    [self.tasks addObject:text];
    [_taskTable reloadData];
    [_taskField setText:@""];
    [_taskField endEditing:YES];//关闭软键盘
}

#pragma mark -
#pragma mark 实现UITableViewDataSource代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *id = @"cell";
    UITableViewCell *cell = [_taskTable dequeueReusableCellWithIdentifier:id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    cell.textLabel.text = self.tasks[indexPath.row];
    return cell;
}

// tableView继承自scrollView，实现其中的即将拖动代理方法。作用：拖动屏幕时，将键盘隐藏
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.taskField.superview endEditing:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    //程序将要退出到后台时，保存数据
    [self.tasks writeToFile:docPath() atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.tasks writeToFile:docPath() atomically:YES];
}

@end
