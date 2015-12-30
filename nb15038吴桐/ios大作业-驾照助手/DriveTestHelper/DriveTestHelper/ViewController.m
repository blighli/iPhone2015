//
//  ViewController.m
//  DriveTestHelper
//
//  Created by wp on 15/12/15.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "ViewController.h"
#import "SelectVehicle.h"
#import "FirstViewController.h"
#import "SubjectTwoViewController.h"
#import "WebViewController.h"

@interface ViewController ()
{
    UIView *_selectVehicleView;
    __weak IBOutlet UIButton *selectBtn;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _selectVehicleView = [[SelectVehicle alloc]initWithFrame:self.view.frame andBtn:selectBtn];
    [self.view addSubview:_selectVehicleView];
    _selectVehicleView.alpha=0;
    UIBarButtonItem *item=[[UIBarButtonItem alloc]init];
    item.title=@"";
    self.navigationItem.backBarButtonItem=item;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(id)sender {
    UIButton *btn = sender;
    switch (btn.tag) {
        case 100:
        {
            [UIView animateWithDuration:0.3 animations:^{
                _selectVehicleView.alpha=1;
            }];
        }
            break;
        case 101:
        {
            //科目一
            FirstViewController *fvc=[[FirstViewController alloc]init];
            fvc.navTitle=@"科目一：理论考试";
            [self.navigationController pushViewController:fvc animated:YES];
        }
            break;
        case 102://科目二
        {
            SubjectTwoViewController *stvc=[[SubjectTwoViewController alloc]init];
            stvc.title=@"科目二：小路考";
            [self.navigationController pushViewController:stvc animated:YES];
        }
            break;
        case 103://科目三
        {
            SubjectTwoViewController *stvc=[[SubjectTwoViewController alloc]init];
            stvc.title=@"科目三：大路考";
            [self.navigationController pushViewController:stvc animated:YES];
        }
            break;
        case 104://科目四
        {
            FirstViewController *fvc=[[FirstViewController alloc]init];
            fvc.navTitle=@"科目四：文明驾驶";
            [self.navigationController pushViewController:fvc animated:YES];
        }
            break;
        case 105://报名须知
        {
            WebViewController *wvc=[[WebViewController alloc]initWithUrl:@"http://m.jxedt.com/zhinan/7/"];
            [self.navigationController pushViewController:wvc animated:YES];
        }
            break;
        case 106://新手上路
        {
            WebViewController *wvc=[[WebViewController alloc]initWithUrl:@"http://m.jxedt.com/tools/"];
            [self.navigationController pushViewController:wvc animated:YES];
        }
            break;
        default:
            break;
    }
    
}

@end
