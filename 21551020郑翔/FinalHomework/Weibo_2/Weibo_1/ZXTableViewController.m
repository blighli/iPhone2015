//
//  ZXTableViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXTableViewController.h"
#import "ZXWeibo.h"
#import "ZXWeiboTableViewCell.h"
#import "ZXWeiboFrame.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "ZXCommentNavigationViewController.h"
#import "ZXCommentTableViewController.h"

@interface ZXTableViewController ()

@property (nonatomic, strong) NSArray *weiboFrames;

@property (nonatomic, strong) NSMutableArray *resArray;

@property (nonatomic, assign) BOOL isChange;

@end

@implementation ZXTableViewController

#pragma mark - lazy load -

- (NSArray *)weiboFrames
{
    if (_weiboFrames == nil || [AppDelegate APP].weiboChange == YES) {
        //        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        //        NSLog(@"path:%@", path);
        //        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        //        sleep(10);
        //        while (_resArray == nil) {
        //            sleep(2);
        //        }
        NSArray *arrayDict = _resArray;
        NSMutableArray *arrayModels = [NSMutableArray array];
        NSLog(@"arrayDict: %@", arrayDict);
        
        
        
        for (NSDictionary *dict in arrayDict) {
            //创建一个模型数据
            ZXWeibo *model = [ZXWeibo weiboWithDict:dict];
            //创建一个frame模型
            ZXWeiboFrame *modelFrame = [[ZXWeiboFrame alloc] init];
            NSLog(@"OK");
            modelFrame.weibo = model;
            NSLog(@"OK");
            [arrayModels addObject:modelFrame];
        }
        _weiboFrames = arrayModels;
        if ([AppDelegate APP].weiboChange == YES) {
            [AppDelegate APP].weiboChange = NO;
        }
        
    }
    return _weiboFrames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self showTabBar];

    [self loadWeibo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.weiboFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //1.获取模型数据
    ZXWeiboFrame *model = self.weiboFrames[indexPath.row];
    
    //2.创建单元格
    static NSString *ID = @"weibo_cell";
    ZXWeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZXWeiboTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //3.设置单元格数据
    cell.weiboFrame = model;
    
    //4.返回单元格
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXWeiboFrame *weiboFrame = self.weiboFrames[indexPath.row];
    return weiboFrame.rowHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXWeiboFrame *weiboFrame = self.weiboFrames[indexPath.row];
    [AppDelegate APP].currentWeiboId = weiboFrame.weibo.weibo_id;
    ZXCommentTableViewController *tvc = [[ZXCommentTableViewController alloc] init];
    [tvc setTitle:@"评论"];
    ZXCommentNavigationViewController *nvc = [[ZXCommentNavigationViewController alloc] initWithRootViewController:tvc];
    
    [self presentViewController:nvc animated:YES completion:nil];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)loadWeibo
{
    NSString *urlString = [NSString stringWithFormat:@"http://127.0.0.1:8000/report/"];
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
            NSLog(@"loadWeibo _resArray: %@", _resArray);
//            _isChange = YES;
            [AppDelegate APP].weiboChange = YES;
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



//-(void)showTabBar {
//    if (self.tabBarController.tabBar.hidden) {
//        self.tabBarController.tabBar.hidden = NO;
//    }
//    NSLog(@"showTabBar: %@", self.tabBarController.tabBar.hidden);
//}
//
//-(void)hideTabBar {
//    if (!self.tabBarController.tabBar.hidden) {
//        self.tabBarController.tabBar.hidden = YES;
//    }
//}

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
