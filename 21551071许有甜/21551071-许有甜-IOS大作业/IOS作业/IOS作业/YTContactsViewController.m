//
//  YTContactsViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights

#import "YTContactsViewController.h"
#import "YTAddContactViewController.h"
#import "YTContact.h"
#import "YTEditContactViewController.h"
#import "YTContactCell.h"

@interface YTContactsViewController ()<YTAddContactViewControllerDelegate,YTEditContactViewControllerDelegate>

@property(nonatomic, copy)NSMutableArray *contacts;
- (IBAction)delete:(id)sender;

- (IBAction)addContact:(UIBarButtonItem *)sender;


@end

@implementation YTContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:YTContactsFilepath];
        
        if (_contacts == nil) {
            _contacts = [NSMutableArray array];
        }
        
    }
    
    return _contacts;
}

#pragma 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    
    YTContactCell *cell = [YTContactCell cellWithTableView:tableView];
    
    // 设置cell数据
    YTContact* contact = self.contacts[indexPath.row];
    NSLog(@"%ld",indexPath.row);
    cell.contact = contact;
    NSLog(@"%@&&&&%@",contact.name,contact.phone);
    return cell;
    
}


- (IBAction)delete:(id)sender {
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

- (IBAction)addContact:(UIBarButtonItem *)sender {
    YTAddContactViewController *addCv = [[YTAddContactViewController alloc]init];
    addCv.contactDelegate = self;
    [self.navigationController pushViewController:addCv animated:YES];
}

#pragma tableView代理方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除模型数据
        [self.contacts removeObjectAtIndex:indexPath.row];
        
        // 刷新表格数据
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        // 归档
        [NSKeyedArchiver archiveRootObject:self.contacts toFile:YTContactsFilepath];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YTEditContactViewController *editCv = [[YTEditContactViewController alloc] init];
    editCv.contact = self.contacts[indexPath.row];
    editCv.contactDelegate = self;
    [self.navigationController pushViewController:editCv animated:YES];
}
#pragma YTAddViewController的代理方法
- (void)addViewController:(YTAddContactViewController *)addVc didiAddContact:(YTContact *)contact
{
    NSLog(@"%@----%@",contact.name,contact.phone);
    [self.contacts addObject:contact];
    
    [self.tableView reloadData];
    
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:YTContactsFilepath];
}

#pragma YTEditViewControllerDelegate的代理方法
- (void)editViewController:(YTEditContactViewController *)editViewController didSaveContact:(YTContact *)contact
{
    [self.tableView reloadData];
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:YTContactsFilepath];
}
@end
