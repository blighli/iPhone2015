//
//  YTMemoViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import "YTMemoViewController.h"
#import "YTMemoCell.h"
#import "YTMemo.h"
#import "YTMemoFrame.h"
#import "YTEditViewController.h"
#import "YTAddViewController.h"
@interface YTMemoViewController ()<YTEditViewControllerDelegate,YTAddViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *memoFrames;
- (IBAction)barBtnClick:(UIBarButtonItem *)sender;
- (IBAction)edit:(UIBarButtonItem *)sender;

@end

@implementation YTMemoViewController

- (NSMutableArray *)memoFrames
{
    if (_memoFrames == nil) {
        _memoFrames = [NSKeyedUnarchiver unarchiveObjectWithFile:YTMemoFilepath];
        if (_memoFrames == nil) {
            _memoFrames = [NSMutableArray array];
        }
    }
    return _memoFrames;
}

- (IBAction)barBtnClick:(UIBarButtonItem *)sender {
    
    YTAddViewController *vc = [[YTAddViewController alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete implementation, return the number of rows
    return self.memoFrames.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YTMemoFrame* memoFrame = self.memoFrames[indexPath.row];
    //NSLog(@"%d",memoFrame.cellHeight);
    return memoFrame.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YTMemoCell* cell = [YTMemoCell cellWithTableView:tableView];
    
    YTMemoFrame* memoFrame = self.memoFrames[indexPath.row];
    cell.memoFrame = memoFrame;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YTEditViewController *vc = [[YTEditViewController alloc] init];
    
    if (self.memoFrames.count) {
        // 模型数据
        YTMemoFrame *memoFrame = self.memoFrames[indexPath.row];
        vc.memoFrame = memoFrame;
        vc.delegate = self;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark 代理方法
- (void)editViewController:(YTEditViewController *)editMemoVc didSaveInfo:(YTMemoFrame *)memoFrame
{
    [self.tableView reloadData];
    // 归档
    [NSKeyedArchiver archiveRootObject:self.memoFrames toFile:YTMemoFilepath];
}

#pragma mark 代理方法
- (void)addViewController:(YTAddViewController *)addMemoVc didSaveInfo:(YTMemoFrame *)memoFrame
{
    [self.memoFrames addObject:memoFrame];
    // 归档
    [NSKeyedArchiver archiveRootObject:self.memoFrames toFile:YTMemoFilepath];
    [self.tableView reloadData];
}

- (IBAction)edit:(UIBarButtonItem *)sender {
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

#pragma mark 代理方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除模型数据
        [self.memoFrames removeObjectAtIndex:indexPath.row];
        
        // 刷新表格数据
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        // 归档
        [NSKeyedArchiver archiveRootObject:self.memoFrames toFile:YTMemoFilepath];
       
    }
}


@end
