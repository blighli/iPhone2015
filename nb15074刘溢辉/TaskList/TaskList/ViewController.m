//
//  ViewController.m
//  TaskList
//
//  Created by LYH on 15/10/31.
//  Copyright © 2015年 LYH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TaskField;
@property (weak, nonatomic) IBOutlet UIButton *ConfirmButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readNSUserDefaults];
    UITableView *tableView = (id)[self.view viewWithTag:1024];
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)readNSUserDefaults
{
    user = [NSUserDefaults standardUserDefaults];
    taskList = [[NSMutableArray alloc] initWithCapacity:0];
    NSInteger taskCount = [user integerForKey:@"taskCount"];
    for (NSInteger i = 0; i <= taskCount; ++i) {
        NSString *taskId = [NSString stringWithFormat:@"%d", i];
        NSString *taskName = [user stringForKey:taskId];
        [taskList addObject:taskName];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showInputMethod:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)addTask:(id)sender {
    UITableView *tableView = (id)[self.view viewWithTag:1024];
    [tableView beginUpdates];
    [taskList addObject: self.TaskField.text];
    NSArray *_tempIndexPathArr = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    [tableView insertRowsAtIndexPaths:_tempIndexPathArr withRowAnimation:UITableViewRowAnimationNone];
    [tableView endUpdates];
    NSString *taskId = [NSString stringWithFormat:@"%d", [taskList count] - 1];
    [user setObject:self.TaskField.text forKey:taskId];
    [user setObject:taskId forKey:@"taskCount"];
    [self.TaskField setText:@""];
    
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [taskList count];
    //return [self.dwarray count];
}
#pragma mark -
#pragma mark Table Delegate Methods

- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:SimpleTableIdentifier];
    }
    NSInteger idx = [taskList count] - 1 - indexPath.row;
    cell.textLabel.text = taskList[idx];//self.dwarray[indexPath.row];
    return cell;
}


@end
