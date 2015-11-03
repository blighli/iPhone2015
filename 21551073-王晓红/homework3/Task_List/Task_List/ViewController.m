//
//  ViewController.m
//  Task_List
//
//  Created by apple on 15/11/2.
//  Copyright © 2015年 wxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


NSString *docPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(
                                                            NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [[pathList objectAtIndex:0]
                     stringByAppendingPathComponent:@"data.txt"];
    NSLog(@"%@", str);
    return str;
    
}

@implementation ViewController

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




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 相关对象的创建
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        tasks = [plist mutableCopy];
    } else {
        tasks = [[NSMutableArray alloc] init];
    }

    
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    
    //显示表格
    taskTable = [[UITableView alloc] initWithFrame:tableFrame
                                             style:UITableViewStylePlain];
    [taskTable setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    
    //设置为UITableView的数据源
    [taskTable setDataSource:self];
   
    //文本输入框
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
    //insert按钮
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
       [[self view] addSubview:taskTable];
       //用self.window会报错
       [[self view] addSubview:taskField];
       [[self view] addSubview:insertButton];
    
    [insertButton addTarget:self
                     action:@selector(addTask:)
           forControlEvents:UIControlEventTouchUpInside];
    
    
    if ([tasks count] == 0) {
        [tasks addObject:@"wxh_test1"];
        [tasks addObject:@"wxh_test2"];
        [tasks addObject:@"wxh_test3"];
    }

   
    // Do any additional setup after loading the view, typically from a nib.
}

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
