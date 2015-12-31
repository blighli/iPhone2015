//
//  TaskListController.m
//  Task List
//
//  Created by LiDan on 15/11/3.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "TaskListController.h"
#import "UIView+Extension.h"

@interface TaskListController()
@property (nonatomic,weak) UITextField *field;
@end

@implementation TaskListController

-(NSMutableArray *)array
{
    if (!_array) {
        NSMutableArray *array = [NSMutableArray array];
        _array = array;
    }
    return _array;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
     self.tableView.tableFooterView=[[UIView alloc]init];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else
    {
        return self.array.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell;
    if (indexPath.section == 0)
    {
        cell = [[UITableViewCell alloc]init];
        UITextField *field = [[UITextField alloc]init];
        field.x = 5;
        field.y = 5;
        field.width = 280;
        field.height = 30;
        field.placeholder = @"请输入";
        [[field layer] setBorderWidth:0.5];
        [[field layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[field layer] setCornerRadius:5];
        self.field = field;
        
        UIButton *insert = [[UIButton alloc]init];
        insert.x = field.width + field.x + 5;
        insert.y = field.y;
        insert.width = 80;
        insert.height = 30;
        [[insert layer] setBorderWidth:0.5];
        [[insert layer] setBorderColor:[UIColor lightGrayColor].CGColor];
        [[insert layer] setCornerRadius:5];
        
        [insert setTitle:@"insert" forState:UIControlStateNormal];
        [insert setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [insert setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [insert setBackgroundColor:[UIColor whiteColor]];
        [insert addTarget:self action:@selector(insertClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:field];
        [self.view addSubview:insert];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }
    else
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celltext"];
        cell.textLabel.text = self.array[indexPath.row];
    }
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


-(void)insertClick
{
    [self.array addObject:self.field.text];
    self.field.text = @"";
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
    
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
