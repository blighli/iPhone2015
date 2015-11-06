//
//  ViewController.m
//  Work03
//
//  Created by 黄梦妃 on 15/10/28.
//  Copyright © 2015年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtTask;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *tasksArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"任务";
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.btnSubmit addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self read];
//    [self.tableView reloadData];
}



-(void)submit
{
    if(!self.tasksArr)
    {
        self.tasksArr=[NSMutableArray array];
    }
    [self.tasksArr insertObject:self.txtTask.text atIndex:0];
    [self write];
    [self.txtTask resignFirstResponder];
    NSIndexPath *p=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[p] withRowAnimation:UITableViewRowAnimationLeft];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasksArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"reuse"];
    
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    
    cell.textLabel.text=self.tasksArr[indexPath.row];
    return cell;
}

-(void)read
{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    //得到文件绝对路径
    NSString *filePath = [[documentPath objectAtIndex:0] stringByAppendingPathComponent:@"plistDemo.plist"];
    // 读取文件
    self.tasksArr = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    
    NSLog(@"tasksArr=%@", self.tasksArr);
}

-(void)write
{
    // 沙盒的目录
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    //得到文件绝对路径
    NSString *filePath = [[documentPath objectAtIndex:0] stringByAppendingPathComponent:@"plistDemo.plist"];
    
    //写入文件
    [self.tasksArr writeToFile:filePath atomically:YES];
    

    
   
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        [self.tasksArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
    
    [self write];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
