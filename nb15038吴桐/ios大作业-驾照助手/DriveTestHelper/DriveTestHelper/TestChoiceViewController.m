//
//  TestChoiceViewController.m
//  DriveTestHelper
//
//  Created by wp on 15/12/16.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "TestChoiceViewController.h"
#import "TestChoiceTableViewCell.h"
#import "TestChoiceModel.h"
#import "AnswerViewController.h"
#import "SubTestSelectModel.h"

@interface TestChoiceViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@end

@implementation TestChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.title=_viewTitle;
    [self createTableView];
}

-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}

#pragma mark - TabelView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId=@"TestChoiceTableViewCell";
    TestChoiceTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil] lastObject];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        //圆角
        cell.numberLabel.layer.masksToBounds=YES;
        cell.numberLabel.layer.cornerRadius=8;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }
    if (_type==1) {
        TestChoiceModel *model=_dataArr[indexPath.row];
        cell.numberLabel.text=model.pid;
        cell.titleLabel.text=model.pname;
    } else if (_type==2) {
        SubTestSelectModel *model=_dataArr[indexPath.row];
        cell.numberLabel.text=model.serial;
        cell.titleLabel.text=model.sname;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AnswerViewController *avc=[[AnswerViewController alloc]init];
    if (_type==1) {
        avc.type=1;
        avc.chapterNumber=(int)indexPath.row+1;
    } else if (_type==2) {
        avc.type=4;
        SubTestSelectModel *model=_dataArr[indexPath.row];
        avc.subStrNumber=model.sid;
    }
    [self.navigationController pushViewController:avc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
