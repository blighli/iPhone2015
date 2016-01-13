//
//  ViewController.m
//  MyLBS
//
//  Created by helmsmanmac on 15/9/2.
//  Copyright (c) 2015年 helmsmanmac. All rights reserved.
//

#import "ViewController.h"
#import "ShowDataTableViewController.h"


typedef NS_ENUM(NSUInteger, FunctionSelet) {
    LBS_GAME = 0,
    LBS_EAT,
    LBS_REST,
    LBSE_BUSSION,
    LBS_PURCHASE,
    LBS_OTHER1,
    LBS_OTHER2,
    LBS_OTHER3,
    LBS_OTHER4,
};

@interface ViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar * searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    _searchBar = [[UISearchBar alloc] init];
    [_searchBar setDelegate:self];
    [_searchBar setPlaceholder:@"请输入您要查找的内容"];
    [_searchBar setBackgroundImage:[self createImageFromColor:[UIColor orangeColor] imageSize:CGSizeMake(self.view.frame.size.width, 50)]];
//    设置成不可自动布局
    [_searchBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_searchBar];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_searchBar]|"
//                                                                     options:0
//                                                                     metrics:nil
//                                                                        views:NSDictionaryOfVariableBindings(_searchBar)]];
//    
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_searchBar]|"
//                                                                      options:0
//                                                                      metrics:nil
//                                                                        views:NSDictionaryOfVariableBindings(_searchBar)]];
//    
    NSUInteger dataArr[] = {LBS_GAME,LBS_EAT,LBS_REST,LBSE_BUSSION,LBS_PURCHASE,LBS_OTHER1,LBS_OTHER2,LBS_OTHER3,LBS_OTHER4};
    
    
    
    CGFloat btnSize = 80.0;
    CGFloat spacing = (self.view.frame.size.width - 3*btnSize) / 4;
    
    for(int i = 0; i < 9; i++){
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTag:dataArr[i]];
        [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(theBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-btnH-[btn(btnW)]"
                                                                          options:0
                                                                          metrics:@{@"btnH":@(i%3*(btnSize+spacing)+spacing),
                                                                                    @"btnW":@(btnSize)}
                                                                            views:NSDictionaryOfVariableBindings(btn)]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-btnV-[btn(btnH)]"
                                                                          options:0
                                                                          metrics:@{@"btnV":@(80+i/3*(btnSize+spacing)+spacing),
                                                                                    @"btnH":@(btnSize)}
                                                                            views:NSDictionaryOfVariableBindings(btn)]];
    }
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_searchBar]|"
                                                                     options:0
                                                                     metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_searchBar)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_searchBar]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_searchBar)]];
}

- (void)theBtnPressed:(id)sender {
    
    UIButton * btn = (UIButton *)sender;
    NSString * userSelectString = nil;
    switch(btn.tag){
        case LBS_GAME:
            userSelectString = @"休闲娱乐";
            NSLog(@"游戏");
            break;
        case LBS_EAT:
            userSelectString = @"餐饮";
            NSLog(@"吃喝");
            break;
        case LBS_REST:
            userSelectString = @"电影院";
            NSLog(@"休息");
            break;
        case LBSE_BUSSION:
            userSelectString = @"逛街";
            NSLog(@"逛街");
            break;
        case LBS_PURCHASE:
            userSelectString = @"购物";
            NSLog(@"购物");
            break;
        default:
            userSelectString = @"other";
            break;
    }
    
    [self gotoShowDataView:userSelectString];
}

- (UIImage *)createImageFromColor:(UIColor *)color imageSize:(CGSize)size {
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, frame);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)gotoShowDataView:(NSString *)str {
    ShowDataTableViewController * showDataController = [[ShowDataTableViewController alloc] initWithStyle:UITableViewStylePlain];
    showDataController.searchString = str;
    [self.navigationController pushViewController:showDataController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

#pragma mark -SearchBarDelegate 
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_searchBar resignFirstResponder];
    
    NSString * newString = [searchBar.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(newString.length == 0){
        return;
    }
    
    [self gotoShowDataView:newString];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
