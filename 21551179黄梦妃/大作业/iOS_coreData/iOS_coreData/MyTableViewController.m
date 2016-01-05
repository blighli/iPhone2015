//
//  MyTableViewController.m
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/27.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "MyTableViewController.h"
#import "Folder.h"
#import "Incident.h"
#import "ContentViewController.h"
#import "NSDate+Util.h"
#import "UIColor+Util.h"
#import "FolderTableController.h"

@interface MyTableViewController ()<NSFetchedResultsControllerDelegate,ContentViewControllerDelegate,UISearchBarDelegate,UISearchResultsUpdating>
@property(strong,nonatomic)NSFetchedResultsController *fetchedResultsController;
@property(strong,nonatomic)NSMutableArray *incidentArr;
@property(strong,nonatomic)NSMutableArray *incidentSearchArr;
@property(assign,nonatomic)BOOL isDelete;
@property(assign,nonatomic)BOOL isMove;
@property(assign,nonatomic)BOOL isAdd;
@property(strong,nonatomic)NSIndexPath *currrentPath;
@property(strong,nonatomic)Folder *folder;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation MyTableViewController


-(instancetype)initWithFolder:(Folder *)folder
{
    self=[super initWithStyle:UITableViewStylePlain];
    if(self)
    {
        
        
        UIApplication *app=[UIApplication sharedApplication];
        id deletege=app.delegate;
        self.managedObjectContext=[deletege managedObjectContext];
        
        
        
        NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Folder"];
        NSPredicate * predicate;
        predicate = [NSPredicate predicateWithFormat:@"name = %@", folder.name];

        
        NSSortDescriptor *sortDescriptor=[[NSSortDescriptor alloc]initWithKey:@"time" ascending:YES];
        
        [request setSortDescriptors:@[sortDescriptor]];
        
//        [request setPredicate:predicate];
        
        self.fetchedResultsController=[[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext: self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
        
        self.fetchedResultsController.delegate=self;
        
        __autoreleasing NSError *error;
       if(![self.fetchedResultsController performFetch:&error])
       {
           [NSFetchedResultsController deleteCacheWithName:nil];
       }
        
        self.folder=folder;

        
        NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:@"time" ascending:NO];
        NSArray *sortDescriptors = [NSArray arrayWithObjects:sd, nil];
        self.incidentArr = [[[folder incident] sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
        
    }
    return self;
}

-(void)initView
{
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
//    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
     _searchController.searchBar.frame = CGRectMake(0, 64, self.searchController.searchBar.frame.size.width, 44.0);
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [_searchController.searchBar setBackgroundColor:[UIColor clearColor]];
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addObject)];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBar"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"navBar"]];
    
    self.tableView.backgroundColor=[UIColor themeColor];

    self.title=self.folder.name;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
   
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.isMove=NO;
    self.isAdd=NO;
}

-(void)addObject
{
    ContentViewController *con=[[ContentViewController alloc]init];
    con.delegate=self;
    self.isAdd=YES;
    [self.navigationController pushViewController:con animated:YES];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.searchController.active) {
        NSLog(@"incidentSearchArr=%lu",(unsigned long)[self.incidentSearchArr count]);

        return [self.incidentSearchArr count];
        
    }else{
        NSLog(@"incidentArr=%lu",(unsigned long)[self.incidentArr count]);
       return [self.incidentArr count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.backgroundColor=[UIColor themeColor];
    }

    Incident *incident1;
    
    if (self.searchController.active) {
        
        incident1=[self.incidentSearchArr objectAtIndex:indexPath.row];
    }
    else{
       incident1=[self.incidentArr objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text=incident1.content;
    cell.detailTextLabel.text=[incident1.time getDateTimeString];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currrentPath=indexPath;

    NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:@"time" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sd, nil];
    self.incidentArr = [[[self.folder incident] sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    Incident *incident1=[self.incidentArr objectAtIndex:indexPath.row];
    
    if(self.searchController.active)
    {
       incident1=[self.incidentSearchArr objectAtIndex:indexPath.row];
    }else
    {
        incident1=[self.incidentArr objectAtIndex:indexPath.row];
    }
    
    ContentViewController *con=[[ContentViewController alloc] initWithIncident:incident1];
    con.delegate=self;
    
    self.searchController.active=NO;
    
    [self.navigationController pushViewController:con animated:YES];
}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
      
        self.currrentPath=indexPath;
        self.isDelete=YES;
        Incident *i;
        //        Folder *folder=[self.fetchedResultsController fetchedObjects][0];
        //        NSLog(@"n=%ld",[[folder incident] count]);
        if(self.searchController.active)
        {
            i=[self.incidentSearchArr objectAtIndex:indexPath.row];
        }else
        {
            i=[self.incidentArr objectAtIndex:indexPath.row];
        }
        
        
        [self.folder removeIncidentObject:i];
        
        [self.managedObjectContext deleteObject:i];
        __autoreleasing NSError *error;
        
        [self.managedObjectContext save:&error];
        
    }];
    
    // 添加一个更多按钮
    UITableViewRowAction *moreRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"移动到"handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {

        self.currrentPath=indexPath;
        
        NSArray *arr=[self.fetchedResultsController fetchedObjects];
        FolderTableController *f=[[FolderTableController alloc] initWithArray:arr];
        f.folder=self.folder;
        Incident *i;
        //        Folder *folder=[self.fetchedResultsController fetchedObjects][0];
        //        NSLog(@"n=%ld",[[folder incident] count]);
        if(self.searchController.active)
        {
            i=[self.incidentSearchArr objectAtIndex:indexPath.row];
        }else
        {
            i=[self.incidentArr objectAtIndex:indexPath.row];
        }
        f.incident=i;
        self.isMove=YES;
        [self.navigationController pushViewController:f animated:YES];
        
    }];
    moreRowAction.backgroundColor=[UIColor grayColor];
    // 将设置好的按钮放到数组中返回
    return @[deleteRowAction, moreRowAction];
}


#pragma mark - search

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"content CONTAINS[c] %@", searchString];
    if (self.incidentSearchArr!= nil) {
        [self.incidentSearchArr removeAllObjects];
    }
    //过滤数据
    self.incidentSearchArr= [NSMutableArray arrayWithArray:[self.incidentArr filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}


#pragma mark -ContentViewController 委托


-(void)addInCidentWithContent:(NSString *)content
{
    Incident *incident=[NSEntityDescription insertNewObjectForEntityForName:@"Incident" inManagedObjectContext:self.managedObjectContext];
    incident.content=content;
    incident.time=[NSDate date];
    
    [self.incidentArr insertObject:incident atIndex:0];
    
//    Folder *folder=[self.fetchedResultsController fetchedObjects][0];
//    [folder addIncidentObject:incident];
    [self.folder addIncidentObject:incident];
    
    __autoreleasing NSError *error;
    
    [self.managedObjectContext save:&error];
    
    
    

}

-(void)updateInCident:(Incident *)incident
{
 
    __autoreleasing NSError *error;
    [self.managedObjectContext save:&error];
    
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[self.currrentPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}


#pragma mark -NSFetchedResultsController委托
//监控coredata的数据变化

//数据将要开始变化
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

//数据变化( 增 删 改 移动 )
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView=self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
            if(self.isDelete)
            {
                NSLog(@"isDelete");
                self.isDelete=NO;

                
                NSLog(@"%ld",self.currrentPath.row);
                if(self.searchController.active)
                {
                    Incident *i=[self.incidentSearchArr objectAtIndex:self.currrentPath.row];
                    [self.incidentSearchArr removeObjectAtIndex:self.currrentPath.row];
                    [self.incidentArr removeObject:i];

                }else
                {
                    [self.incidentArr removeObjectAtIndex:self.currrentPath.row];
                }
                
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:self.currrentPath] withRowAnimation:UITableViewRowAnimationFade];
            }
            else if(self.isMove)
            {
                NSLog(@"isMove");
                
                NSLog(@"%ld",self.currrentPath.row);
                if(self.searchController.active)
                {
                    Incident *i=[self.incidentSearchArr objectAtIndex:self.currrentPath.row];
                    [self.incidentSearchArr removeObjectAtIndex:self.currrentPath.row];
                    [self.incidentArr removeObject:i];
                    
                }else
                {
                    [self.incidentArr removeObjectAtIndex:self.currrentPath.row];
                }
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:self.currrentPath] withRowAnimation:UITableViewRowAnimationFade];
                
            }
            else if(self.isAdd)
            {
                self.isAdd=NO;
                NSIndexPath *path=[NSIndexPath indexPathForRow:0 inSection:0];
                
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationFade];
            }
            break;
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        default:
            break;
    }
}

//数据变化结束
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

@end
