//
//  ViewController.m
//  AtlasMap
//
//  Created by Atlas on 15/12/25.
//  Copyright © 2015年 Atlas. All rights reserved.
//

#import "ViewController.h"
#import "ShowDataTableViewController.h"

typedef NS_ENUM(NSUInteger, FunctionSelet) {
    LBS_GAME = 0,
    LBS_EAT,
    LBS_REST,
    LBS_BUSSINESS,
    LBS_SHOPPING,
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
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //搜索框
    _searchBar = [[UISearchBar alloc]init];
    [_searchBar setDelegate:self];
    [_searchBar setPlaceholder:@"请输入想要查询的位置"];
    [_searchBar setBackgroundImage:[self CreateImage:[UIColor orangeColor]imageSize:CGSizeMake(self.view.frame.size.width, 50)]];
    [_searchBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_searchBar];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_searchBar]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_searchBar)]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_searchBar]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_searchBar)]];
    
    
    //九宫格按钮
    NSUInteger dataArr[] = {LBS_GAME,LBS_EAT,LBS_REST,LBS_BUSSINESS,LBS_SHOPPING,LBS_OTHER1,LBS_OTHER2,LBS_OTHER3,LBS_OTHER4};
    
    CGFloat btnSize = 80;
    CGFloat spacing = (self.view.frame.size.width - 3*btnSize) / 4;
    
    for (int i =0 ; i<9; i++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
        [btn setTag:dataArr[i]];
        [btn addTarget:self action:@selector(theBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
//        [btn setBackgroundColor:[UIColor cyanColor]];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]] forState:UIControlStateNormal];
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
    
}

//跳转到下一页
-(void) theBtnPressed:(id)sender{
    UIButton *btn = (UIButton *)sender;
    NSString *userSelectString = nil;
    switch (btn.tag) {
        case LBS_GAME:
            userSelectString = @"休息";
            NSLog(@"rest");
            break;
        case LBS_EAT:
            userSelectString = @"餐饮";
            NSLog(@"eat");
            break;
        case LBS_REST:
            userSelectString = @"娱乐";
            NSLog(@"rest");
            break;
        case LBS_BUSSINESS:
            userSelectString = @"商业";
            NSLog(@"bussiness");
            break;
        case LBS_SHOPPING:
            userSelectString = @"购物";
            NSLog(@"bussiness");
            break;
        default:
            userSelectString = @"停车场";
            NSLog(@"other");
            break;
    }
    
    [self gotoShowDataView:userSelectString];
}


//携带数据跳转下一页
- (void) gotoShowDataView:(NSString *)str{
    ShowDataTableViewController *showDataController = [[ShowDataTableViewController alloc]init];
    showDataController.searchString = str;
    [self.navigationController pushViewController:showDataController animated:YES];

}

-(UIImage *) CreateImage:(UIColor *) color imageSize:(CGSize) size
{
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, frame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

#pragma mark _searchBarDelegate

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    NSString *tempStr = [searchBar.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (tempStr.length == 0 ) {
        return;
    }
    [self gotoShowDataView:tempStr];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
