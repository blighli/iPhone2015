//
//  ViewController.m
//  Third_Homework
//
//  Created by zhuzhu on 15/11/3.
//  Copyright © 2015年 zhuzhu. All rights reserved.
//

#import "ViewController.h"
#import "Data.h"

@interface ViewController ()

@property(strong, nonatomic) Data *data;

@end

@implementation ViewController

@synthesize taskListTable, taskTitle, data;

- (void)viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
        data = [[Data alloc] init];
    
        if ([[data tasks] count] == 0) {
                [[data tasks] addObject:@"1"];
                [[data tasks] addObject:@"2"];
                [[data tasks] addObject:@"3"];
                [[data tasks] addObject:@"4"];
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