//
//  ViewController.m
//  HomeWork3
//
//  Created by zhengxiang on 15/11/1.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property(nonatomic)IBOutlet UIButton *insertButton;
@property(nonatomic)IBOutlet UITextField *taskField;
@property(nonatomic)IBOutlet UITableView *taskTable;

@property(nonatomic) NSMutableArray *tasks;

- (IBAction)addTask:(id)sender;

- (void)saveTaskArray:(NSNotification *)notification;

@end

NSString *listPath() {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.plist"];
}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.tasks = [NSMutableArray array];
//    [self tasks];
    NSArray *plist = [NSArray arrayWithContentsOfFile:listPath()];
    if (plist) {
        self.tasks = [plist mutableCopy];
    }
    else {
        self.tasks = [NSMutableArray array];
    }

    CGRect viewFrame = self.view.frame;
    CGRect tableFrame = CGRectMake(0, 80, viewFrame.size.width, viewFrame.size.height - 100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame
                                                  style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.taskTable.dataSource = self;
    
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap Insert";
    
    self.insertButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.insertButton.frame = buttonFrame;
    
    [self.insertButton setTitle:@"Insert"
                       forState:UIControlStateNormal];
    [self.insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.taskTable];
    [self.view addSubview:self.taskField];
    [self.view addSubview:self.insertButton];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(saveTaskArray:)
                                                 name: @"toSave"
                                               object: nil];

}

- (void)saveTaskArray:(NSNotification *)notification {
    [self.tasks writeToFile:listPath() atomically:YES];
    NSLog(@"save %@ successed!", listPath());
}

- (void)addTask:(id)sender {
    NSString *text = [self.taskField text];
    if ([text length] == 0) {
        return ;
    }
    [self.tasks addObject:text];
    [self.taskTable reloadData];

    [self.taskField setText:@""];
    [self.taskField resignFirstResponder];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    NSLog(@"%@", item);
    c.textLabel.text = item;
    return c;
}


@end
