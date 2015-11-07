//
//  ViewController.m
//  homework3-tableview
//
//  Created by 冯浩宇 on 15/10/28.
//  Copyright © 2015年 ZJU. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#define WindowWidth [[UIScreen mainScreen] bounds].size.width
#define WindowHight [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong, nonatomic)UITableView *tableView;
@property(strong, nonatomic)UITextField *textField;
@property(strong, nonatomic)NSMutableDictionary *dict;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dict = [[NSMutableDictionary alloc]init];
    [self getDict];
    [self initView];
}
//设置界面控件
-(void)initView{
    self.tableView = [[UITableView alloc]init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(WindowWidth,WindowHight-30));
    }];
    UITextField *textField = [[UITextField alloc]init];
    self.textField = textField;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:textField];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setPlaceholder:@"Type a task, tap Insert"];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    UIButton *insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setBackgroundColor:[UIColor orangeColor]];
    [insertButton.layer setMasksToBounds:YES];
    [insertButton.layer setCornerRadius:8.0];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [self.view addSubview:insertButton];
    [insertButton addTarget:self action:@selector(clickEvent) forControlEvents:UIControlEventTouchUpInside];
    [insertButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.size.mas_equalTo(CGSizeMake(WindowWidth-260, 30));
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dict count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.row < [self.dict count] ) {
        NSString *value = [self.dict objectForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
        cell.textLabel.text = value;
    }
    
    return cell ;
}
//初始化数据
- (void)getDict{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"list.plist" ofType:nil];
    self.dict = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    if ([self.dict count] == 0) {
        [self.dict setValue:@"Walk the dogs" forKey:@"0"];
        [self.dict setValue:@"Feed the hogs" forKey:@"1"];
        [self.dict setValue:@"Chop the logs" forKey:@"2"];
    }
}
//点击事件
- (void)clickEvent{
    [self getDict];
    NSString *text = [_textField text];
    if (text == nil || text.length == 0) {
        NSLog(@"空");
    }
    else{
        self.textField.text = @"";
        NSString *key = [NSString stringWithFormat:@"%d",[self.dict count]];
        [self.dict setValue:text forKey:key];
        NSLog(@"dict%@",self.dict);
        NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"list.plist" ofType:nil];
        [self.dict writeToFile: plistPath atomically:YES];
        [self getDict];
        [self.tableView reloadData];
        [self.textField resignFirstResponder];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
