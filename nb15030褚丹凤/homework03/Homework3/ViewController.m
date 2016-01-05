//
//  ViewController.m
//  Homework3
//
//  Created by cdf on 15/11/1.
//  Copyright © 2015年 cdf. All rights reserved.
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
    NSArray *plist = [NSArray arrayWithContentsOfFile:path()];
    if(plist)
    {
        tasks = [plist mutableCopy];
    }
    else
    {
        tasks = [[NSMutableArray alloc]init];
    }
   
   
   // CGRect windowFrame =[[UIScreen mainScreen]bounds];
   // UIWindow *theWindow = [[UIWindow alloc] initWithFrame: windowFrame];
    //[self setWindow: theWindow];
    
    //– 设置三个UI对象的frame属性
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame =CGRectMake(228, 40, 72, 31);
    //创建并设置表格UITableView
    taskTable = [[UITableView alloc]initWithFrame:tableFrame
                                             style:UITableViewStylePlain];
    
    [taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //将AppDelegate设置为UITableView的数据源
    [taskTable setDataSource:self];
    //创建并设置文本框（UITextField）
    taskField = [[UITextField alloc]initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task,tap Insert"];
    //创建并设置按钮（UIButton）
    insertButton= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    //为按钮设置回调
    [insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    //将三个UI对象加入UIWindow中
    [[self view] addSubview:taskTable];
    [[self view] addSubview:taskField];
    [[self view] addSubview:insertButton];
    //设置UIWindow的背景颜色，并放到屏幕上
    [[self view] setBackgroundColor:[UIColor whiteColor]];
}

//UITableViewDataSource必须实现两个方法:

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
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
    NSString *item = [tasks objectAtIndex: [indexPath row]];
    [[cell  textLabel] setText:item];
    return cell ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//处理按钮的事件
- (void)addTask:(id)sender
{
    NSString *text = [taskField text]; //从输入框获取新的任务
    if ([text  isEqualToString:@""]) {
        return; //如果是空的什么也不做
    }
    [tasks addObject: text]; //将新的任务添加到模型
    [taskTable reloadData]; //表格视图重新载入数据
    [taskField setText:@""]; //清空输入框
    [taskField resignFirstResponder]; //关闭软键盘
}


@end
