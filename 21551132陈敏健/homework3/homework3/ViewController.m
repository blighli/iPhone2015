//
//  ViewController.m
//  homework3
//
//  Created by 敏少eclipse on 15/11/1.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
//
#import "HeadView.h"
#import "ViewController.h"
#import "Bills.h"
@interface ViewController ()<HeadViewDelegate>
@property (nonatomic,strong) NSMutableArray * bills;
@end

@implementation ViewController

-(NSMutableArray *)bills{
    if (_bills==nil) {
        // 1.获得沙盒根路径
        NSString *home = NSHomeDirectory();
        // 2.document路径
        NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
        NSString *filepath = [docPath stringByAppendingPathComponent:@"bills.plist"];
        NSArray * dictArray=[NSArray arrayWithContentsOfFile:filepath];
        NSMutableArray *tempArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Bills * bill =[Bills billWithDict:dict];
            [tempArray addObject:bill];
        }
        _bills=tempArray;
    }
    return _bills;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HeadView *headView=[HeadView headView];
    headView.delegate=self;
    self.tableView.tableHeaderView=headView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
    static NSString * ID=@"setting";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //设置cell
    Bills *bill=self.bills[indexPath.row];
    [cell.textLabel setText:bill.title];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bills.count;
}

-(void)headViewDidClickedAddBtn:(NSString *)str
{
    Bills * b=[[Bills alloc] init];
    b.title=str;
    [self.bills addObject:b];
    [self.tableView reloadData];
    
    NSMutableArray *tempArray=[NSMutableArray array];
    for (Bills * bill in self.bills) {
        [tempArray addObject:[bill getDictionary]];
    }
    [self saveArray:tempArray];
    
}

- (void)saveArray:(NSMutableArray *)array
{
    // 1.获得沙盒根路径
    NSString *home = NSHomeDirectory();
    // 2.document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filepath = [docPath stringByAppendingPathComponent:@"bills.plist"];
    //NSLog(@"%@",filepath);
    
    [array writeToFile:filepath atomically:YES];
}

@end
