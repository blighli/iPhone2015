//
//  ViewController.m
//  MyList
//
//  Created by 王国军 on 15/10/31.
//  Copyright © 2015年 王国军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

NSString *docPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *str = [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.txt"];
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
    
    
    // 创建对象
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
    
    [taskTable setDataSource:self];
    
    //文本框默认文字
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
    //插入按钮
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
        [tasks addObject:@"Walk the dog"];
        [tasks addObject:@"Get oil changed"];
        [tasks addObject:@"Wrangle some cows"];
    }
}







- (void)addTask:(id)sender
{
    NSString *text = [taskField text];
    if ([text  isEqualToString:@""]) {
        return;
    }
    [tasks addObject: text];
    [taskTable reloadData];
    [taskField setText:@""];
    [taskField resignFirstResponder];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
