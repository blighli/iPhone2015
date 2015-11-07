//
//  ViewController.m
//  mdb_003
//
//  Created by wanghaobo on 15/10/29.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
{
    int flag; //1 add 2del
    
}
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) UIToolbar *tb;
@property (nonatomic,strong) UIBarButtonItem *item2;
@property (nonatomic,strong) UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[Model alloc]init].list;
    self.tb = [[UIToolbar alloc]initWithFrame:CGRectMake(10, 60, self.view.frame.size.width-20, 36)];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(add:)];
    
    
    self.item2 = [[UIBarButtonItem alloc]initWithTitle:@"del" style:UIBarButtonItemStylePlain target:self action:@selector(del:)];
    
    
    NSArray *items = @[item1,self.item2];
    
    CGRect frame = CGRectMake(10, 100, self.view.frame.size.width-20,self.view.frame.size.height-120);
    self.tb.items = items;
    
    self.tv = [[UITableView alloc]initWithFrame:frame];
    
    self.tv.delegate = self;
    self.tv.dataSource =self;
    
    [self.view addSubview:self.tb];
    [self.view addSubview:self.tv];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (IBAction)add:(id)sender{
    NSLog(@"add...");
    NSString *content = self.myTextView.text;
    [self.dataSource insertObject:content atIndex:0];
    [self.tv reloadData];
    
}
- (IBAction)del:(id)sender{
    NSLog(@"delet...");
    if (self.tv.editing){
        self.tv.editing = NO;
        self.item2.title = @"Del";
    }else{
        self.tv.editing = YES;
        self.item2.title = @"Done";
    }
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cid = @"cid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cid];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cid];
        
    }
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
    
}
//提交修改
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //lock
    //roll back
    [self.dataSource removeObjectAtIndex:indexPath.row];
    [self.tv reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
