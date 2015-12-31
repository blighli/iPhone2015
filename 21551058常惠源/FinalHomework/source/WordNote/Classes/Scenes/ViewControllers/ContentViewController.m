//
//  ContentViewController.m
//  WordNote
//
//  Created by 常惠源 on 12/29/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import "ContentViewController.h"
#import "ContentView.h"
#import "CoreDataManagerHelp.h"

@interface ContentViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong)ContentView *rootView;

@property (nonatomic, assign)CGFloat height;

@property (nonatomic, assign)BOOL isTextViewFirstRespond;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isTextViewFirstRespond = YES;
    _rootView = [[ContentView alloc]initWithFrame:self.view.frame];
    if (self.content) {
        _rootView.textTitleField.text = self.content.title;
        _rootView.textView.text = self.content.content;
    }
    self.rootView.backgroundColor = [UIColor k_InterfaceColor];
    self.view = _rootView;
    _height = _rootView.textView.frame.size.height;
    [self addNavigationItems];
}

#pragma mark - 添加导航条按钮
- (void)addNavigationItems
{
    // 添加右上角按钮
    UIBarButtonItem *collection = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(collectionAction)];
    self.navigationItem.rightBarButtonItem = collection;
}
- (void)collectionAction{
    
    NSString *string = [_rootView.textTitleField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (string.length == 0) {
        [HUDHelper addHUDInView:self.view text:@"请输入标题" hideAfterDelay:1];
        return;
    }
    if (self.content) {
        self.content.title = _rootView.textTitleField.text;
        self.content.content = _rootView.textView.text;
        [[CoreDataManagerHelp defaultCoreDataManagerHelp] recomposeContent:self.content customFile:self.customFile];
            [HUDHelper addHUDInView:self.view text:@"保存成功" hideAfterDelay:1];
    }else{
        [[CoreDataManagerHelp defaultCoreDataManagerHelp] addCotentTitle:_rootView.textTitleField.text contentString:_rootView.textView.text customFile:self.customFile];
            [HUDHelper addHUDInView:self.view text:@"保存成功" hideAfterDelay:1];
    }
    //保存成功0.5秒后 popViewController
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (alertView.tag == 1000) {
//        return;
//    }
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
