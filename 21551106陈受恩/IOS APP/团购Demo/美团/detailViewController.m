//
//  detailViewController.m
//  美团
//
//  Created by 陈受恩 on 15/12/17.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "detailViewController.h"
#import "deal Model.h"
#import "UIImageView+WebCache.h"
#import "MianCollectionViewCell.h"


@interface detailViewController ()
//导航栏点击返回事件
@property (weak, nonatomic) IBOutlet UIButton *backClick;
- (IBAction)clickBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    

    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:_md.deal_h5_url]];
    [_webView loadRequest:request];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_md.image_url]];
    
    [self showLabelWithModel:self.md];
      // Do any additional setup after loading the view from its nib.
}
//使用自身的导航栏，系统的
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden=YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showLabelWithModel:(deal_Model*)model{
    self.Title.text=model.title;
    self.subtitle.text=model.Description;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
