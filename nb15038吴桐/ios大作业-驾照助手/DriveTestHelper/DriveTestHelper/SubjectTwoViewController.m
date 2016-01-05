//
//  SubjectTwoViewController.m
//  DriveTestHelper
//
//  Created by wp on 15/12/27.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "SubjectTwoViewController.h"
#import "SubjectTwoTableViewCell.h"
#import <AVKit/AVPlayerViewController.h>
#import <AVFoundation/AVFoundation.h>

@interface SubjectTwoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@end

@implementation SubjectTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"SubjectTwoTableViewCell";
    SubjectTwoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellId owner:self options:nil]lastObject];
    }
    cell.titleImageView.image=[UIImage imageNamed:@"zhijiaozhuanwan.jpg"];
    cell.theTitleLabel.text=[NSString stringWithFormat:@"视频:%ld",indexPath.row+1];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"c01606ijwsw" ofType:@"mp4"];
    NSURL *url=[NSURL fileURLWithPath:path];
    AVPlayerViewController *mpvc=[[AVPlayerViewController alloc]init];
    mpvc.player=[AVPlayer playerWithURL:url];
    
    [self.navigationController pushViewController:mpvc animated:YES];
    [mpvc.player play];
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
