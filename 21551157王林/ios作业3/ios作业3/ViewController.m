//
//  ViewController.m
//  ios作业3
//
//  Created by Appest on 15/11/1.
//  Copyright © 2015年 Appest Limited. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"
#import "AppDelegate.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UIButton *insertButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) UIAlertController *myAlertView;
@property (nonatomic,strong) NSMutableArray *myArray;
@end

@implementation ViewController

- (UIAlertController *)myAlertView{
    if (!_myAlertView) {
        self.myAlertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入内容不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [self.myAlertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //输入框获取焦点
            [self.inputText becomeFirstResponder];
        }]];
    }
    return _myAlertView;
}

- (NSMutableArray *)myArray{
    if (!_myArray) {
        self.myArray = [NSMutableArray new];
    }
    return _myArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置界面
    self.insertButton.layer.masksToBounds = YES;
    self.insertButton.layer.cornerRadius = 10;
    self.insertButton.layer.borderColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.00].CGColor;
    self.insertButton.layer.borderWidth = 1;
    //设置textFileld
    self.inputText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.inputText.returnKeyType = UIReturnKeyDone;
    self.inputText.delegate = self;
    //cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myTableViewCellReuseIdentifier"];
    //设置tableview
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //获取数据
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Task"];
    NSError *error = nil;
    self.myArray = [[app.managedObjectContext executeFetchRequest:fetchRequest error:&error] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//add task
- (IBAction)addTask:(UIButton *)sender {
    if (![_inputText.text isEqualToString:@""]) {
        //插入数据
        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:app.managedObjectContext];
        task.name = _inputText.text;
        //保存
        NSError *error = nil;
        if ([app.managedObjectContext save:&error]) {
            //结束输入
            [_inputText resignFirstResponder];
            _inputText.text = @"";
            //处理数据
            [self.myArray addObject:task];
            //刷新UI
            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.myArray.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
        }else{
            NSAssert(NO, @"error saving context: %@\n%@",[error localizedDescription],[error userInfo]);
        }
        
    }else{
        [self presentViewController:self.myAlertView animated:YES completion:nil];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (![textField.text isEqualToString:@""]) {
        [self addTask:nil];
        return YES;
    }
    return NO;
}

#pragma mark - tableview dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _myArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myTableViewCellReuseIdentifier" forIndexPath:indexPath];
    Task *taskName = _myArray[indexPath.row];
    cell.textLabel.text = taskName.name;
    return cell;
}

//touch other in view,close keyboard
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
//tableview will scroll, close keyboard
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

@end
