//
//  ViewController.m
//  TaskList
//
//  Created by wp on 15/10/29.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "ViewController.h"
#import "DataModel.h"

@interface ViewController ()

@property(strong, nonatomic) DataModel *data;

@end

@implementation ViewController

@synthesize taskListTable, taskTitle, data;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    data = [[DataModel alloc] init];
    
    if ([[data tasks] count] == 0) {
        [[data tasks] addObject:@"ta1"];
        [[data tasks] addObject:@"ta2"];
        [[data tasks] addObject:@"ta3"];
        [[data tasks] addObject:@"ta4"];
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:data
                                             selector:@selector(saveData:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:app];

    
    [taskListTable setDataSource:data];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTask:(UIButton *)sender {
    NSString *task = taskTitle.text;
    if ([task isEqualToString:@""]) {
        return;
    }
    [[data tasks] addObject:task];
    [taskListTable reloadData];
    [taskTitle setText:@""];
    [taskTitle resignFirstResponder];
}
@end
