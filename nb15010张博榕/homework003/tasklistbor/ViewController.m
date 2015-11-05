//
//  ViewController.m
//  tasklistbor
//
//  Created by Bor on 15/11/2.
//  Copyright © 2015年 Apres. All rights reserved.
//

#import "ViewController.h"

NSString *docPath()
{
    NSArray *pathlist = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [pathlist objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
}

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UIButton *insertButton;
@property (weak, nonatomic) IBOutlet UITableView *taskTable;
@property (nonatomic, strong) NSMutableArray *tasks;
@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell ) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"Cell"];
    }
    NSString *item = [_tasks objectAtIndex: [indexPath row]];
    [[cell  textLabel] setText:item];
    return cell;
}

- (IBAction)addTask:(id)sender {
    NSString *text = [_taskField text];
    if ([text  isEqualToString:@""]) {
        return;
    }
    [_tasks addObject: text];
    [_taskTable reloadData];
    [_taskField setText:@""];
    [_taskField resignFirstResponder];
}

-(void)saveData:(NSNotification *)notification {
    [[_tasks copy] writeToFile:docPath() atomically:YES];
}

//- (void)addTask:(id)sender
//{
//    NSString *text = [_taskField text];
//    if ([text  isEqualToString:@""]) {
//        return;
//    }
//    [_tasks addObject: text];
//    [_taskTable reloadData];
//    [_taskField setText:@""];
//    [_taskField resignFirstResponder];
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        _tasks = [plist mutableCopy];
    } else {
        _tasks = [[NSMutableArray alloc] init];
    }
    if ([_tasks count] == 0) {
        [_tasks addObject:@"Walk the dogs"];
        [_tasks addObject:@"Feed the hogs"];
        [_tasks addObject:@"Chop the logs"];
    }
    
    [_taskTable setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    
    [_taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [_taskField setPlaceholder:@"Type a task, tap Insert"];
    
    _insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    [_insertButton addTarget:self action:@selector(addTask:)forControlEvents:UIControlEventTouchUpInside];
    
    UIApplication *appcation = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveData:) name:UIApplicationWillResignActiveNotification object:appcation];
    
    [_taskTable setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
