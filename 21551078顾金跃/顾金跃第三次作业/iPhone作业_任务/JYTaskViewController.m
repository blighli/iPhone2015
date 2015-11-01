//
//  JYTaskViewController.m
//  iPhone作业_任务
//
//  Created by 123 on 15/10/31.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYTaskViewController.h"
//文件保存路径(沙盒)
NSString *docPath(void);
@interface JYTaskViewController ()<UITableViewDelegate,UITableViewDataSource>
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

@end

@implementation JYTaskViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSArray *plist=[NSArray arrayWithContentsOfFile:docPath()];
//    if(plist)
//    {
//        self.tasks=[plist mutableCopy];
//    }
//    else
//    {
//        self.tasks=[[NSMutableArray alloc]init];
//        [self.tasks addObject:@"Walk the dogs"];
//        [self.tasks addObject:@"Feed the hogs"];
//        [self.tasks addObject:@"Chop the logs"];
//    }
//    
//    //设置UITextField和UIButton
//    [self setupHeader];
//    
//    //设置TableView
//    [self setupTableView];
//    self.taskTable.dataSource=self;
//    self.taskTable.delegate=self;
    
}

NSString *docPath()
{
    NSArray *pathList=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [[pathList objectAtIndex:0]stringByAppendingPathComponent:@"data.txt"];
}
-(void)setupHeader
{
    //创建输入按钮
    UITextField *taskField=[[UITextField alloc]init];
    taskField.frame=CGRectMake(10, 40, self.view.frame.size.width*0.8, 40);
    //输入时会在右边出现一个小叉叉
    taskField.clearButtonMode=UITextFieldViewModeWhileEditing;
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task,tap Insert"];
    [self.view addSubview:taskField];
    self.taskField=taskField;
    
    //创建增加按钮
    UIButton *insertButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    insertButton.frame=CGRectMake(self.view.frame.size.width*0.8+10, 40, self.view.frame.size.width*0.2-10, 40);
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [self.view addSubview:insertButton];
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
    tableView.frame=CGRectMake(10, 80, self.view.frame.size.width-20, self.view.frame.size.height*0.5);
    [self.view addSubview:tableView];
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
@end
