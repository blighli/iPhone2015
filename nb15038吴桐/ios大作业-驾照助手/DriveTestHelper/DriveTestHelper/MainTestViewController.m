//
//  MainTestViewController.m
//  DriveTestHelper
//
//  Created by wp on 15/12/25.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "MainTestViewController.h"
#import "AnswerViewController.h"

@interface MainTestViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation MainTestViewController
- (IBAction)tapBtn:(UIButton *)sender {
    switch (sender.tag) {
        case 201:
        {
            AnswerViewController *avc=[[AnswerViewController alloc]init];
            avc.type=5;
            avc.viewTitle=@"";
            [self.navigationController pushViewController:avc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"模拟仿真考试";
    _button1.layer.masksToBounds=YES;
    _button1.layer.cornerRadius=8;
    _button2.layer.masksToBounds=YES;
    _button2.layer.cornerRadius=8;
    
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
