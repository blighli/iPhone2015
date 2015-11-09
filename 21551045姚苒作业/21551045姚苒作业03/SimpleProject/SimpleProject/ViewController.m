//
//  ViewController.m
//  SimpleProject
//
//  Created by 姚苒 on 15/11/5.
//  Copyright © 2015年 姚苒. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UIButton *insertButton;
@property(nonatomic,strong)NSMutableArray *arr;
- (IBAction)addAction:(UIButton*)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arr=[[NSMutableArray alloc]init];
    [_arr addObject:@"tag"];
    [_arr addObject:@"hug"];
    //添加观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.taskField];
}

- (void)textChange{
   
    self.insertButton.enabled = self.taskField.text.length;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text =[_arr objectAtIndex:row];
    return cell;
}


//按钮点击状态
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.taskField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addAction:(UIButton*)sender {
    NSMutableString* str=[[NSMutableString alloc]init];
    str=[NSMutableString stringWithFormat:@"%@",self.taskField.text];
    if(str==nil){
        return;
    }
    [_arr addObject:str];
    [self.tableView reloadData];
    [self.taskField setText:@""];
}



@end
