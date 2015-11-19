//
//  InsertInfoViewController.m
//  ThirdAssignment
//
//  Created by linchaolin on 28/10/2015.
//  Copyright © 2015 linchaolin. All rights reserved.
//

/*
 * #TODO: A slightly better thing to do is to use a custom data source
 * which provides the data source from the service.
 * So this controller doesn't have to conform to the UITableViewDataSource protocol.
 * However, this controller must conform the delegate for better control.
 */
#import "InsertInfoViewController.h"
#import "InsertInfoServiceImpl.h"

@interface InsertInfoViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *insertInfoTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/*
 * Since we may have mutiple service implementation, we use
 * protocol to do bussiness service. So controller doesn't need
 * to know the implementation detail. This helps decoupling the model
 * and this controller.
 *
 * For example: we have two different services, one would be a persistance
 * service using NSUserDefaults, another would be a persistance service
 * using SQLite. Protocol makes it really simple to switch services in this
 * controller with modifying just one line of code.
 */
@property (nonatomic, strong) id <InsertInfoService> service;

//This is the model of the controller.
@property (nonatomic, strong) NSMutableArray *modelArray;

@end

#define TABLE_VIEW_CELL_IDENTIFIER @"insertInfoCell"

@implementation InsertInfoViewController

- (id<InsertInfoService>) service {
    if (!_service) {
        _service = [InsertInfoServiceImpl new];
    }
    return _service;
}

//always return the model from service
- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        _modelArray = [[self.service getInfos]mutableCopy];
    }
    return _modelArray;
}

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    
    //setup the delegate after the table view is set.
    tableView.dataSource = self;
    tableView.delegate = self;
}

- (IBAction)editingDidEndInput:(id)sender {
    [sender resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

//TODO: A good implementation is to store strings in a info plist to support localization.
//For convenience, this app doesn't support localization.
- (void)showAlert: (NSString *)info {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"输入信息错误" message:info preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:controller animated:YES completion:nil];
}

//check validation of text, and show alert if validation doesn't pass.
- (BOOL)isValidInput: (NSString *)checkText {
    //First trim the white space.
    NSString *text = [checkText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //Check the validation of text.
    if ([text isEqualToString:@""]) {
        [self showAlert:@"输入的信息不能为空"];
        return NO;
    }
    
    return YES;
}

- (void)updateUI {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (NSArray<NSIndexPath *> *)indexPathsWithRow:(NSInteger)row
                                    inSection:(NSInteger)section{
    return [[NSArray alloc]initWithObjects:[NSIndexPath indexPathForRow:row inSection:section], nil];
}

// add model to the persistance service and handle the table view data reload.
- (void)addModel:(InfoModel *)model {
    int index = [self.service insertInfo:model];
    [self.modelArray insertObject:model atIndex:index];
    [self.tableView insertRowsAtIndexPaths:[self indexPathsWithRow: index inSection:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)removeModel:(InfoModel *)model {
    NSUInteger index = [self.modelArray indexOfObject:model];
    [self.service removeInfo:model];
    NSArray<NSIndexPath *> * indexPathToRemove = [self indexPathsWithRow:index inSection:0];
    [self.modelArray removeObject:model];
    [self.tableView deleteRowsAtIndexPaths:indexPathToRemove withRowAnimation:UITableViewRowAnimationFade];
}

//Insert button pressed target action
- (IBAction)doInsertInfo:(id)sender {
    [self.insertInfoTextField resignFirstResponder];
    
    NSString *inputInsertText = self.insertInfoTextField.text;
    if (![self isValidInput: inputInsertText]) return;
    
    InfoModel *model = [InfoModel modelWithInfo:inputInsertText];
    [self addModel:model];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.modelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_VIEW_CELL_IDENTIFIER forIndexPath:indexPath];
    
    cell.textLabel.text = ((InfoModel *)self.modelArray[indexPath.row]).info;
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[self.tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self removeModel:self.modelArray[indexPath.row]];
}

@end
