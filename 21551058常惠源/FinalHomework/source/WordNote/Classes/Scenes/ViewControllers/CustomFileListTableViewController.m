//
//  CustomFileListTableViewController.m
//  WordNote
//
//  Created by 常惠源 on 12/29/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import "CustomFileListTableViewController.h"
#import "CustomFile.h"
#import "Content.h"
#import "CoreDataManagerHelp.h"
#import "ContentViewController.h"

@interface CustomFileListTableViewController ()

@property (nonatomic, strong)NSMutableArray *contentArray;

@end

@implementation CustomFileListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationItems];
    self.tableView.backgroundColor = [UIColor k_InterfaceColor];
//    NSLog(@"viewDidLoad");

}
- (void)viewWillAppear:(BOOL)animated{
//    NSLog(@"viewWillAppear");
    [self demandContentArray];
}
- (void)demandContentArray{
//    NSLog(@"demandContentArray");
    self.contentArray = [NSMutableArray array];
    NSArray *array = [[CoreDataManagerHelp defaultCoreDataManagerHelp] demandContentArrayCustomFile:self.customFile];
    
    [self.contentArray addObjectsFromArray:array];
    [self.tableView reloadData];
}
#pragma mark - 添加导航条按钮
- (void)addNavigationItems
{
    // 添加右上角按钮
    UIBarButtonItem *collection = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(collectionAction)];
    self.navigationItem.rightBarButtonItem = collection;
}
- (void)collectionAction{
    ContentViewController *contentVC = [[ContentViewController alloc]init];
    contentVC.customFile = self.customFile;
    contentVC.title = @"记事";
    [self.navigationController pushViewController:contentVC animated:YES];
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
    return self.contentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"customCell"];
    }
    Content *content = self.contentArray[indexPath.row];
    cell.textLabel.text = content.title;
    cell.detailTextLabel.text = [[CoreDataManagerHelp defaultCoreDataManagerHelp] setDateToString:content.date];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    cell.backgroundColor = [UIColor k_InterfaceColor];
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Content *content = self.contentArray[indexPath.row];
        
        [[CoreDataManagerHelp defaultCoreDataManagerHelp] removeContent:content customFile:self.customFile];
        NSLog(@"%@",content.title);
        [self.contentArray removeObject:content];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
       
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Content *content = self.contentArray[indexPath.row];
    ContentViewController *contentVC = [[ContentViewController alloc]init];
    contentVC.customFile = self.customFile;
    contentVC.content = content;
    contentVC.title = content.title;
    [self.navigationController pushViewController:contentVC animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

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
