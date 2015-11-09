//
//  ViewController.m
//  1
//
//  Created by Lv DJ on 15/11/2.
//  Copyright © 2015年 Lv DJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)UITextField *text;
@property (nonatomic, strong)NSMutableArray *data;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, weak)NSString *str;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 150)];
    text.borderStyle = UITextBorderStyleRoundedRect;
    text.placeholder = @"Please input something...";
    text.clearButtonMode = UITextFieldViewModeUnlessEditing;
    text.font = [UIFont fontWithName:@"Arial" size:16.f];
    text.textAlignment = NSTextAlignmentLeft;
    text.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    text.keyboardType = UIKeyboardTypeDefault;
    text.returnKeyType = UIReturnKeyDone;
    text.delegate = self;
    text.layer.borderColor = [UIColor blackColor].CGColor;
    _text = text;
    
    UIButton *finishBtn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 80, 200, 50, 30)];
    [finishBtn setTitle:@"Add" forState:UIControlStateNormal];
    [finishBtn setBackgroundColor:[UIColor lightGrayColor]];
    [finishBtn addTarget:self action:@selector(addRows:) forControlEvents:UIControlEventTouchUpInside];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 240, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 240) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor blackColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView = tableView;
    
    [self.view addSubview:_tableView];
    [self.view addSubview:_text];
    [self.view addSubview:finishBtn];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    _data = array;
}

- (void)addRows:(id)sender {
    _str = _text.text;
    [self.data addObject:_str];
    _text.text = nil;
    [self.tableView reloadData];
    
}
#pragma mark tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.data objectAtIndex:[indexPath row]];
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.text resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
