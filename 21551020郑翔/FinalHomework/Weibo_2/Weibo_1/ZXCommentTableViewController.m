//
//  ZXCommentTableViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/21.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXCommentTableViewController.h"
#import "ZXCommentTableViewCell.h"
#import "ZXComment.h"
#import "ZXCommentFrame.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "ZXSendCommentViewController.h"

@interface ZXCommentTableViewController ()

@property (nonatomic, strong) NSArray *commentFrames;

@property (nonatomic, strong) NSMutableArray *resArray;

@property (nonatomic, assign) BOOL isChange;

@end

@implementation ZXCommentTableViewController

#pragma mark - lazy load -

- (NSArray *)commentFrames
{
    if (_commentFrames == nil || [AppDelegate APP].commentChange == YES) {
        NSArray *arrayDict = _resArray;
        NSMutableArray *arrayModels = [NSMutableArray array];
        NSLog(@"arrayDict: %@", arrayDict);
        
        
        
        for (NSDictionary *dict in arrayDict) {
            //创建一个模型数据
            ZXComment *model = [ZXComment commentWithDict:dict];
            //创建一个frame模型
            ZXCommentFrame *modelFrame = [[ZXCommentFrame alloc] init];
            NSLog(@"OK");
            modelFrame.comment = model;
            NSLog(@"OK");
            [arrayModels addObject:modelFrame];
        }
        _commentFrames = arrayModels;
        if ([AppDelegate APP].commentChange == YES) {
            [AppDelegate APP].commentChange = NO;
        }
        
    }
    return _commentFrames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(toReturn)];
    
    self.navigationItem.leftBarButtonItem = bbi;
    
    UIBarButtonItem *bbi1 = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(toComment)];
    
    self.navigationItem.rightBarButtonItem = bbi1;
    
    [self loadComment];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(refreshComment)
                                                 name: @"RefreshComment"
                                               object: nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)toReturn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)toComment {
//    [self dismissViewControllerAnimated:YES completion:nil];
//    ZXSendCommentViewController *v = [self.navigationController.viewControllers objectAtIndex:1];
    NSLog(@"--------------------------------------------");
    NSLog(@"toComment: %@", self.navigationController.viewControllers);
    ZXSendCommentViewController *v1 = [[ZXSendCommentViewController alloc] init];
    [v1 setTitle:@"发表评论"];
    [self.navigationController pushViewController:v1 animated:YES];

}

- (void)refreshComment
{
    [self loadComment];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.commentFrames.count;
}

- (void)loadComment
{
    NSString *urlString = [NSString stringWithFormat:@"http://127.0.0.1:8000/report/loadComment/%@/", [AppDelegate APP].currentWeiboId];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"NSDictionary!");
            NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:responseObject];
            NSLog(@"%@", dict);
        } else if ([responseObject isKindOfClass:[NSArray class]]) {
            
            NSLog(@"NSArray");
            NSArray *array = [[NSArray alloc] initWithArray:responseObject];
            _resArray = [array mutableCopy];
            //            for (NSMutableDictionary *d in _resArray) {
            //                [d removeObjectForKey:@"id"];
            //            }
            NSLog(@"loadComment _resArray: %@", _resArray);
//            _isChange = YES;
            [AppDelegate APP].commentChange = YES;
            [self.tableView reloadData];

            
        } else {
            NSLog(@"unknown class of jsonObject");
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }
     ];
    //    sleep(1);
    NSLog(@"resArray: %@", _resArray);
    //    return [resArray mutableCopy];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取模型数据
    ZXCommentFrame *model = self.commentFrames[indexPath.row];
    
    //2.创建单元格
    static NSString *CID = @"comment_cell";
    ZXCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CID];
    if (cell == nil) {
        cell = [[ZXCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CID];
    }
    
    //3.设置单元格数据
    cell.commentFrame = model;
    
    //4.返回单元格
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXCommentFrame *commentFrame = self.commentFrames[indexPath.row];
    return commentFrame.rowHeight;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
