//
//  ViewController.m
//  TaskList
//
//  Created by chenyufeng on 15/11/1.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

@property(strong,nonatomic) NSMutableArray *taskArray;

@property(strong,nonatomic) NSArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //应用启动的时候加载数据库文件；
  NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
  NSFetchRequest *fetchData = [[NSFetchRequest alloc] initWithEntityName:@"Task"];
  self.arr = [context executeFetchRequest:fetchData error:nil];
  
  self.taskArray = [[NSMutableArray alloc] initWithArray:[self.arr valueForKey:@"taskname"]];
}


#pragma mark - UITableViewDataSource
//每一个section有几个cell；
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return self.taskArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
  cell.textLabel.text = [self.taskArray objectAtIndex:indexPath.row];
  
  return cell;
}

#pragma mark - 点击增加按钮
- (IBAction)addTaskButtonClick:(id)sender {
  
  NSString *inputStr = [[NSMutableString alloc] initWithFormat:@"%@",self.inputTextField.text];
  inputStr = [inputStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  
  //判断如果输入的为空，则不添加；
  if ([inputStr  isEqual: @""]) {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入的内容不能为空" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
  } else {
    
    //每点击一次“确定”按钮后，就把该数据存储到CoreData中；
    [self saveToCoreData:inputStr];
    
    //把一个文本存储到taskArray数组中；
    [self.taskArray insertObject:self.inputTextField.text atIndex:self.taskArray.count];
    [self.taskTableView reloadData];
    
    //清空输入框；
    self.inputTextField.text = nil;
    
    //点击确定后消失软键盘；
    [self.inputTextField resignFirstResponder];
    
    
  }
  
  
}

#pragma mark - 保存数据到CoreData;
- (void) saveToCoreData:(NSString *)taskName{
  
  NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
  NSManagedObject *row = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
  
  [row setValue:taskName forKey:@"taskname"];
  [context save:nil];
  NSLog(@"已保存到数据库");
}




#pragma mark - UIScrollViewDelegate
//滚动TableView的时候隐藏软键盘；
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  
  [self.inputTextField resignFirstResponder];
  
}




@end


























