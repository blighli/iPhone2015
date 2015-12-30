//
//  FolderTableController.m
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/30.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "FolderTableController.h"

@interface FolderTableController ()<UIAlertViewDelegate>
//@property(strong,nonatomic)NSFetchedResultsController *fetchedResultsController;
@property(strong,nonatomic)NSArray *folderArr;
@property(strong,nonatomic)NSManagedObjectContext *managedObjectContext;
@property(strong,nonatomic)NSIndexPath *currentPath;
@end

@implementation FolderTableController


//
//- (instancetype)initWithFetch:(NSFetchedResultsController *)fetchedResultsController
//{
//    self = [super init];
//    if (self) {
//        
//        UIApplication *app=[UIApplication sharedApplication];
//        id deletege=app.delegate;
//        self.managedObjectContext=[deletege managedObjectContext];
//        
//        self.fetchedResultsController=fetchedResultsController;
//        
////        self.fetchedResultsController.delegate=self;
//        
//        __autoreleasing NSError *error;
//        [self.fetchedResultsController performFetch:&error];
//        
//        self.folderArr=[self.fetchedResultsController fetchedObjects];
//    }
//    return self;
//}

- (instancetype)initWithArray:(NSArray *)folderArr
{
    self = [super init];
    if (self) {
        
        UIApplication *app=[UIApplication sharedApplication];
        id deletege=app.delegate;
        self.managedObjectContext=[deletege managedObjectContext];
        
        
        self.folderArr=folderArr;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.folderArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    }
    cell.textLabel.text=[[self.folderArr objectAtIndex:indexPath.row] name];
    
    if([self.folder isEqual:[self.folderArr objectAtIndex:indexPath.row]])
    {
        self.currentPath=indexPath;
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(self.currentPath.row==indexPath.row)
    {
        return;
    }
    self.currentPath=indexPath;
    NSString *s=[[self.folderArr objectAtIndex:indexPath.row] name];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"确认移动到文件夹%@",s] delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    [alert show];
}

#pragma mark - UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        
        __autoreleasing  NSError *error;
        Folder *f=[self.folderArr objectAtIndex:self.currentPath.row];
        
        Incident *i=[NSEntityDescription insertNewObjectForEntityForName:@"Incident" inManagedObjectContext:self.managedObjectContext];
        
        i.content=self.incident.content;
        i.time=self.incident.time;
        
        [self.folder removeIncidentObject:self.incident];
        
        [self.managedObjectContext deleteObject:self.incident];
        [self.managedObjectContext save:&error];
        
        [f addIncidentObject:i];
        [self.managedObjectContext save:&error];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
