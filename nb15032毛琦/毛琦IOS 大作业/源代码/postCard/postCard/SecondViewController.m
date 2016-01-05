//
//  SecondViewController.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "SecondViewController.h"
#import "secondTableCell.h"
#import "NoteViewController.h"
#import "DB.h"
#import "PostDataBase.h"
#import "PostModel.h"

@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-69) style:UITableViewStylePlain];

    UIImageView *back = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back8.jpg"]];
    [_table setBackgroundView:back];
    
    _table.dataSource = self;
    _table.delegate = self;
    [self.view addSubview:_table];
    
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"lengyin.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.array = [NSMutableArray array];
    
    [DB shareDataBase];
    self.array = [PostDataBase selectAll];
    
    if ([_array count] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您还没有记录哦~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.array = [PostDataBase selectAll];
    [self.table reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *name = @"pool";
    secondTableCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
    if (!cell) {
        cell = [[secondTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:name];
    }
    PostModel *model = [_array objectAtIndex:[_array count]-indexPath.row-1];
    
    cell.model = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ScreenHeight/4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NoteViewController *note = [[NoteViewController alloc] init];
    PostModel *model = [_array objectAtIndex:[_array count]-indexPath.row-1];
    // 传model
    [note getModel:model];
    [note getPic:model.stamp];
    
    note.HasValue = @"HasValue";
    [self.navigationController pushViewController:note animated:YES];
    
    //[PostDataBase deleteWithModel:model];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        PostModel *model = [_array objectAtIndex:[_array count]-indexPath.row-1];
        [PostDataBase deleteWithModel:model];
        NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld.png",(long)model.infoId]];
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        NSString *path2 = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ldDone.png",(long)model.infoId]];
        [[NSFileManager defaultManager] removeItemAtPath:path2 error:nil];
        
        _array = [PostDataBase selectAll];
    }
    [_table reloadData];
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat
{
    cell.backgroundColor = [UIColor clearColor];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
