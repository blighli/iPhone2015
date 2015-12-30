//
//  WebViewController.m
//  DriveTestHelper
//
//  Created by wp on 15/12/27.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
    UIWebView *_wv;
}
@end

@implementation WebViewController

-(instancetype)initWithUrl:(NSString *)url{
    self=[super init];
    if (self) {
        NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
        _wv=[[UIWebView alloc]initWithFrame:self.view.frame];
        [_wv loadRequest:request];
        [self.view addSubview:_wv];
    }
    return self;
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
