//
//  ViewController.m
//  homework3
//
//  Created by cstlab on 15/11/3.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import "ViewController.h"
NSString *path()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(
                                                            NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0]
            stringByAppendingPathComponent:@"data.txt"];
}

@implementation ViewController

- (void)viewDidLoad {
    // Override point for customization after application launch.
    //初始化程序的状态，完成相关对象的创建
    NSArray *plist = [NSArray arrayWithContentsOfFile:path()];
    if(plist)
    {
        tasks = [plist mutableCopy];
    }
    else
    {
        tasks = [[NSMutableArray alloc]init];
    }
    
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
    [insert_button addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    //将三个UI对象加入UIWindow中
    [[self view] addSubview:task_table];
    [[self view] addSubview:task_field];
    [[self view] addSubview:insert_button];
    //设置UIWindow的背景颜色，并放到屏幕上
    [[self view] setBackgroundColor:[UIColor whiteColor]];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [task_table dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell ) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"Cell"];
    }
    NSString *item = [tasks objectAtIndex: [indexPath row]];
    [[cell  textLabel] setText:item];
    return cell ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addTask:(id)sender
{
    NSString *text = [task_field text]; //从输入框获取新的任务
    if ([text  isEqualToString:@""]) {
        return; //如果是空的什么也不做
    }
    [tasks addObject: text]; //将新的任务添加到模型
    [task_table reloadData]; //表格视图重新载入数据
    [task_field setText:@""]; //清空输入框
    [task_field resignFirstResponder]; //关闭软键盘
}

@end
