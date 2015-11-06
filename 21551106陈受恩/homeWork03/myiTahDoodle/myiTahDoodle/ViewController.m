//
//  ViewController.m
//  myiTahDoodle
//
//  Created by 陈受恩 on 15/10/31.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
   
    NSMutableArray *taskitems;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    taskitems=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
    [taskitems addObject:@"Walk the dog"];
    [taskitems addObject:@"Get oil changed"];
    [taskitems addObject:@"Find my towel"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [taskitems count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [taskitems objectAtIndex:indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)insertTask:(UIButton *)sender {
    
    NSString *str=[self.taskField text];
    if([str length]==0){
        return;
    }
    //取值后的操作
   [taskitems addObject:str];
   [self.tableview reloadData];
    
    //清空文本框和 关闭键盘
    [self.taskField setText:@" "];
    [self.taskField resignFirstResponder];
}

@end
