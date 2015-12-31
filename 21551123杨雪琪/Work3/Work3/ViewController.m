//
//  ViewController.m
//  Work3
//
//  Created by YXQ on 15/11/2.
//  Copyright (c) 2015年 YXQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSString *item = [_tasks objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item];
    return cell;
}

NSString *docPath()
{
    //获取应用程序沙盒的Documents目录
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory,  NSUserDomainMask, YES);
    //完整的文件名
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.txt"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if(plist){
        _tasks = [plist mutableCopy];
    }else{
        _tasks = [[NSMutableArray alloc] init];
    }
    if([_tasks count] == 0)
    {
        [_tasks addObject:@"iOS"];
        [_tasks addObject:@"Android"];
        [_tasks addObject:@"J2EE"];
    }
    [_taskTable setDataSource:self];
    //创建并设置表格UITableView[拖动控件不需要初始化]
    //_taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [_taskTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    //创建并设置文本框[拖动控件不需要初始化]
    //_taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [_taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [_taskField setPlaceholder:@"请输入。。。"];
    //创建并设置按钮[拖动控件不需要初始化]
    //_insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //[_insertButton setFrame:buttonFrame];
    [_insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    //为按钮设置回调
    [_insertButton addTarget:self action:@selector(addTask) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)addTask
{
    NSString *text = [_taskField text];
    if([text isEqualToString:@""]){
        return ;
    }
    [_tasks addObject:text];
    [_taskTable reloadData];
    [_tasks writeToFile:docPath() atomically:YES];
    [_taskField setText:@""];
    //关闭软键盘
    [_taskField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
