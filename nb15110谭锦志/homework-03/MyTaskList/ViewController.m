//
//  ViewController.m
//  MyTaskList
//
//  Created by apanoo on 15/11/1.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"

@interface ViewController ()

@end

// 数据存储路径
NSString *docPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.txt"];
}

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell ) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"Cell"];
    }
    Task *item = [tasks objectAtIndex: [indexPath row]];
    [[cell  textLabel] setText:[item text]];
    return cell ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 对象创建
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        tasks = [plist mutableCopy];
    } else {
        tasks = [[NSMutableArray alloc] init];
    }
    
    // 设置三个ui对象的frame属性
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    // 设置并创建表格UITableView
    taskTable = [[UITableView alloc] initWithFrame:tableFrame];
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // 创建并设置文本框
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a new task"];
    
    // 创建并设置按钮
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    // 为按钮设置回调
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    // 三个空间加入视图
    [self.view addSubview:taskTable];
    [self.view addSubview:taskField];
    [self.view addSubview:insertButton];
    
    // 设置uitableview的数据源
    [taskTable setDataSource:self];
    
    if ([tasks count] == 0) {
        [tasks addObject: [[Task alloc] initWithTitle:@"Task one"]];
        [tasks addObject: [[Task alloc] initWithTitle:@"Task two"]];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addTask:(id)sender
{
    NSString *text = [taskField text];  // 从输入框获取新的任务
    if ([text  isEqualToString:@""]) {
        return;  // 如果是空的什么也不做
    }
    [tasks addObject: [[Task alloc] initWithTitle:text]]; // 将新的任务添加到模型
    [taskTable reloadData];  // 表格视图重新载入数据
    [taskField setText:@""]; // 清空输入框
    [taskField resignFirstResponder];  // 关闭软键盘
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
