//
//  matchInfoViewController.m
//  cardGame
//
//  Created by zhouxw on 12/23/15.
//  Copyright © 2015 zhouxw. All rights reserved.
//

#import "matchInfoViewController.h"

@interface matchInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textBody;

@end

@implementation matchInfoViewController
-(void)setMatchInfo:(NSMutableAttributedString *)matchInfo{
    _matchInfo=matchInfo;
    if(self.view.window){
        [self updateUI];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}
-(void)updateUI{
    self.textBody.text=[NSString stringWithFormat:@"%@",self.matchInfo];
    [self.textBody.textStorage addAttribute:NSStrokeColorAttributeName value:[UIColor redColor]range:NSMakeRange(0, [self.matchInfo length])];
    [self.textBody.textStorage addAttribute:NSStrokeWidthAttributeName value:@-10 range:NSMakeRange(0, [self.matchInfo length])];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
