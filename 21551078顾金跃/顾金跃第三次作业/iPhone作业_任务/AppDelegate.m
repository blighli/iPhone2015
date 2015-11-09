//
//  AppDelegate.m
//  iPhone作业_任务
//
//  Created by 123 on 15/10/31.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "AppDelegate.h"
#import "JYTaskViewController.h"

//文件保存路径(沙盒)
//NSString *docPath(void);

@interface AppDelegate ()<UITableViewDelegate,UITableViewDataSource>

//****************************************************************
//显示任务的TableView
@property(nonatomic,strong)UITableView *taskTable;
//用来输入新任务的TextField
@property(nonatomic,strong)UITextField *taskField;
//增加按钮
@property(nonatomic,strong)UIButton *insertButton;

//任务可变数组
@property(nonatomic,strong)NSMutableArray *tasks;

//增加任务
-(void)addTask;
//****************************************************************
@end

@implementation AppDelegate

//沙盒路径
-(NSString *)docPath
{
    NSArray *pathList=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[pathList objectAtIndex:0]stringByAppendingPathComponent:@"data.txt"];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    self.window.rootViewController=[[JYTaskViewController alloc]init];;
    [self.window makeKeyAndVisible];
    
//**************************************************************************
    NSArray *plist=[NSArray arrayWithContentsOfFile:[self docPath]];
    if(plist)
    {
        self.tasks=[plist mutableCopy];
    }
    else
    {
        self.tasks=[[NSMutableArray alloc]init];
        [self.tasks addObject:@"Walk the dogs"];
        [self.tasks addObject:@"Feed the hogs"];
        [self.tasks addObject:@"Chop the logs"];
    }
    
    //设置UITextField和UIButton
    [self setupHeader];
    
    //设置TableView
    [self setupTableView];
    //设置数据源
    self.taskTable.dataSource=self;
    //设置代理
    self.taskTable.delegate=self;

//**************************************************************************
    return YES;
}
-(void)setupHeader
{
    //创建输入按钮
    UITextField *taskField=[[UITextField alloc]init];
    taskField.frame=CGRectMake(10, 40, self.window.frame.size.width*0.8, 40);
    //输入时会在右边出现一个小叉叉
    taskField.clearButtonMode=UITextFieldViewModeWhileEditing;
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task,tap Insert"];
    [self.window addSubview:taskField];
    self.taskField=taskField;
    
    //创建增加按钮
    UIButton *insertButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    insertButton.frame=CGRectMake(self.window.frame.size.width*0.8+10, 40, self.window.frame.size.width*0.2-10, 40);
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [self.window addSubview:insertButton];
    self.insertButton=insertButton;
    //为按钮设置触发事件
    [self.insertButton addTarget:self action:@selector(insertClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)insertClick
{
    //增加任务
    [self addTask];
}

-(void)setupTableView
{
    UITableView *tableView=[[UITableView alloc]init];
    tableView.frame=CGRectMake(10, 80, self.window.frame.size.width-20, self.window.frame.size.height*0.5);
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.window addSubview:tableView];
    self.taskTable=tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasks.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    NSString *item=[self.tasks objectAtIndex:[indexPath row]];
    cell.textLabel.text=item;
    return cell;
}

-(void)addTask
{
    //获取输入框的内容
    NSString *text=self.taskField.text;
    if([text isEqualToString:@""])
    {
        //若是空就什么都不做
        return ;
    }
    //将任务加入到数组中
    [self.tasks addObject:text];
    
    //重新刷新列表
    [self.taskTable reloadData];
    
    //清空输入框
    [self.taskField setText:@""];
    
    //关闭软键盘
    [self.taskField resignFirstResponder];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//当应用程序退出时保存任务数据
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self.tasks writeToFile:[self docPath] atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

//NSString *docPath()
//{
//    NSArray *pathList=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    
//    return [[pathList objectAtIndex:0]stringByAppendingPathComponent:@"data.txt"];
//}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.FK.GJY.iPhone_____" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"iPhone_____" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"iPhone_____.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
