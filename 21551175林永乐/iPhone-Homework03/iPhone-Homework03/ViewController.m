//
//  ViewController.m
//  iPhone-Homework03
//
//  Created by alezai on 15/10/30.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import "ViewController.h"
#import "Schedule.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) Schedule *schedule;

@end

@implementation ViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.schedule = [[Schedule alloc] init];
    self.submitButton.enabled = NO;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTableview:)];
    tapGesture.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response

- (IBAction)handleButtonTap:(UIButton *)sender {
    [self insertText];
}

#pragma mark - Private Methods
- (NSString *)dataPath{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = array[0];
    return [path stringByAppendingPathComponent:@"data.archive"];
}

- (void)tapTableview:(UITapGestureRecognizer *)sender{
    if ([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
}

- (void)insertText{
    if (self.textField.text.length == 0) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"please input words" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertVC addAction:okAction];
        [self presentViewController:alertVC animated:YES completion:nil];
    }else{
        NSString *str = self.textField.text;
        [self.schedule insertScheduleWithString:str];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.schedule schedulesCount] - 1) inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        self.textField.text = nil;
        [self.textField resignFirstResponder];
    }
}

- (void)deleteAtIndex:(NSIndexPath *)indexPath{
    [self.schedule deleteScheduleAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Delegate
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.schedule schedulesCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.schedule scheduleTextAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteAtIndex:indexPath];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
}

#pragma mark - TextField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.submitButton.enabled = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.submitButton.enabled = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self insertText];
    return YES;
}



@end
