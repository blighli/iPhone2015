//
//  ViewController.h
//  plh-homework3
//
//  Created by peilinghui on 15/11/1.
//  Copyright © 2015年 peilinghui. All rights reserved.
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([tasks count]==0)
    {
        [tasks addObject:@"遛狗"];
        [tasks addObject:@"打酱油"];
        [tasks addObject:@"挤牛奶"];
    }
    return [tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [task_table dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"Cell"];
    }
    NSString *item = [tasks objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item];
    return cell;
}


- (void)viewDidLoad {
    // Override point for customization after application launch.
    //初始化程序的状态，完成相关对象的创建
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
    //    CGRect window_frame = [[UIScreen mainScreen] bounds];
    //    UIWindow *the_window =[[UIWindow alloc] initWithFrame:window_frame];
    //[self setWindow:the_window];
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
    //[[self view] makeKeyAndVisible];
    // return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
