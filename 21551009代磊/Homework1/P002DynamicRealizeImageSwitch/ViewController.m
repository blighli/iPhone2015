//
//  ViewController.m
//  P002DynamicRealizeImageSwitch
//
//  Created by TooWalker on 10/8/15.
//  Copyright © 2015 TooWalker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) int index;
@property (nonatomic, strong) NSMutableArray *arrPic;
@property (nonatomic, strong) UIImageView *imgViewPage;
@property (nonatomic, strong) UILabel *lblPage;
@property (nonatomic, strong) UILabel *lblTitle;
@property (nonatomic, strong) UIButton *btnBefore;
@property (nonatomic, strong) UIButton *btnNext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imgViewPage = [[UIImageView alloc]init];
    self.imgViewPage.frame = CGRectMake(0, 0, 375, 667);
    
    self.btnBefore = [[UIButton alloc]init];
    self.btnBefore.frame = CGRectMake(0, 180, 100, 300);
    self.btnBefore.tag = 1;
    [self.btnBefore addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnNext = [[UIButton alloc]init];
    self.btnNext.frame = CGRectMake(275, 180, 100, 300);
    self.btnNext.tag = 2;
    [self.btnNext addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    self.lblPage = [[UILabel alloc]init];
    self.lblPage.frame = CGRectMake(85, 530, 60, 30);
    self.lblPage.textColor = [UIColor whiteColor];
    self.lblPage.textAlignment = NSTextAlignmentCenter;

    
    self.lblTitle = [[UILabel alloc]init];
    self.lblTitle.frame = CGRectMake(145, 530, 140, 30);
    self.lblTitle.textColor = [UIColor whiteColor];
    self.lblTitle.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.imgViewPage];
    [self.view addSubview:self.btnBefore];
    [self.view addSubview:self.btnNext];
    [self.view addSubview:self.lblTitle];
    [self.view addSubview:self.lblPage];
    
    
    
    self.arrPic = [[NSMutableArray alloc]init];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"DesktopPage.plist" ofType:nil];
    self.arrPic = [self.arrPic initWithContentsOfFile:path];
    [self switchPage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(void)click:(UIButton *)sender {
    if (sender.tag == 1) {
        self.index--;
        [self switchPage];
    }else{
        self.index++;
        [self switchPage];
    }
}


-(void)switchPage{
    NSMutableDictionary *dictPage = [[NSMutableDictionary alloc]init];
    dictPage = [NSMutableDictionary dictionaryWithDictionary: self.arrPic[self.index]];
    
    self.imgViewPage.image = [UIImage imageNamed: dictPage[@"icon"]];
    self.lblPage.text = [NSString stringWithFormat:@"%d/%ld", self.index + 1, self.arrPic.count];
    self.lblTitle.text = dictPage[@"title"];
    
    self.btnBefore.enabled = (self.index != 0);
    self.btnNext.enabled = (self.index != self.arrPic.count - 1);
}
@end


























